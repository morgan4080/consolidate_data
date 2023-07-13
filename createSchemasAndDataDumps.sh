#!/bin/bash

MYSQL_USER="root"
MYSQL_PASSWORD="2fpLxthn"
COLUMN="tenant_id"
COLUMN2="tenant_pid"
TARGET_TABLES=("b_region" "b_branch")
SOURCES=$(ls sources/)
SOURCE_FILES=()

# Collect source file names
for file in $SOURCES; do
  SOURCE_FILES+=("$file")
done

# Process each source file
for fl in "${SOURCE_FILES[@]}"; do
  # Extract tenant name from source file
  TENANT=$(cat sources/"$fl" | grep "Database:" | awk '{ print $5 }')
  echo "Tenant: $TENANT"

  # Drop existing schema and create new one
  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "DROP DATABASE IF EXISTS $TENANT;"

  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "CREATE DATABASE $TENANT;"

  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -e "SET FOREIGN_KEY_CHECKS=0;"

  # Import source file into the new schema
  sed -i '' 's/DEFINER=[^*]*\*/\*/g' sources/"$fl"

  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" < sources/"$fl"

  # Process each table in the schema
  TABLES=$(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -se "SHOW TABLES;")

  for TABLE in $TABLES; do
    if printf '%s\0' "${TARGET_TABLES[@]}" | grep -Fxqz -- "$TABLE"; then
      IS_BASE_TABLE=$(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -se "SELECT COUNT(*) FROM information_schema.VIEWS WHERE TABLE_NAME = '$TABLE';")
      if [ "$IS_BASE_TABLE" -eq 0 ]; then
        # Retrieve primary key column
        PRIMARY_KEY=$(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -se "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME = '$TABLE' AND CONSTRAINT_NAME = 'PRIMARY' LIMIT 1;")

        # GET TABLES RELYING ON TARGET TABLES

       AFFECTED_TABLES=$(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" --skip-column-names -e "SELECT DISTINCT TABLE_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE REFERENCED_TABLE_NAME = '$TABLE' AND REFERENCED_COLUMN_NAME = '$PRIMARY_KEY';")

        # Check if the variable is empty

        if [ -z "$AFFECTED_TABLES" ]; then
            echo "NO TABLES AFFECTED BY $TABLE"
        else
          # ADD AFFECTED TABLES TO TARGET TABLES

          for AFFECTED_TABLE in $AFFECTED_TABLES; do
              if [[ ! " ${TARGET_TABLES[*]} " =~ $AFFECTED_TABLE ]]; then
                  echo "PUSHING AFFECTED_TABLE $AFFECTED_TABLE TO ${TARGET_TABLES[*]}"
                  TARGET_TABLES+=("$AFFECTED_TABLE")
              else
                  echo "Skipping duplicate table: $AFFECTED_TABLE"
              fi
          done

        fi

      fi
    fi
  done


  echo "TARGET_TABLES length: ${#TARGET_TABLES[@]}"


  for TABLE in $TABLES; do
    # Check if table is a base table (not a view)
    IS_BASE_TABLE=$(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -se "SELECT COUNT(*) FROM information_schema.VIEWS WHERE TABLE_NAME = '$TABLE';")
    if [ "$IS_BASE_TABLE" -eq 0 ]; then
      if printf '%s\0' "${TARGET_TABLES[@]}" | grep -Fxqz -- "$TABLE"; then

        # Add new columns to the table
        mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -e "ALTER TABLE $TABLE ADD $COLUMN VARCHAR(10) NULL;"
        mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -e "ALTER TABLE $TABLE ADD $COLUMN2 VARCHAR(15) NULL;"

        # Retrieve primary key column
        PRIMARY_KEY=$(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -se "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME = '$TABLE' AND CONSTRAINT_NAME = 'PRIMARY' LIMIT 1;")

        echo "Primary key for table $TABLE: $PRIMARY_KEY"

        # Update values in the new columns
        IDS=$(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -se "SELECT $PRIMARY_KEY FROM $TABLE;")

        for ID in $IDS; do
          echo "Updating column $COLUMN2 in table $TABLE with $TENANT _ $ID (where $PRIMARY_KEY is $ID)"
          CONCATED="$TENANT$ID"

          mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -e "UPDATE $TABLE SET $COLUMN2 = '$CONCATED' WHERE $PRIMARY_KEY = '$ID';"
        done

        # Update the new column with tenant value
        echo "Updating column $COLUMN with $TENANT in table $TABLE"
        mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -e "UPDATE $TABLE SET $COLUMN = '$TENANT';"
      fi
    fi
  done

  echo "CONSOLIDATION STEPS"

  TABLES_TO_DUMP=""
  
  for element in "${TARGET_TABLES[@]}"
  do
    TABLES_TO_DUMP+="$element "
  done

  mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" --tables $TABLES_TO_DUMP --result-file="./schema/schema-$TENANT.sql" --no-data

  mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" --tables $TABLES_TO_DUMP --result-file="./data/data-$TENANT.sql" --no-create-info
done
