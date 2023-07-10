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

  # Import source file into the new schema
  sed -i '' 's/DEFINER=[^*]*\*/\*/g' sources/"$fl"
  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" < sources/"$fl"

  # Process each table in the schema
  TABLES=$(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -se "SHOW TABLES;")
  for TABLE in $TABLES; do
    # Check if table is a base table (not a view)
    IS_BASE_TABLE=$(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -se "SELECT COUNT(*) FROM information_schema.VIEWS WHERE TABLE_NAME = '$TABLE';")
    if [ "$IS_BASE_TABLE" -eq 0 ]; then
      if printf '%s\0' "${TARGET_TABLES[@]}" | grep -Fxqz -- "$TABLE"; then

        echo "::::::::::::::::::::::::::::::::::::::::::: $TABLE"

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
          TO_ADD="_"
          CONCATED="$TENANT$TO_ADD$ID"
          mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -e "UPDATE $TABLE SET $COLUMN2 = '$CONCATED' WHERE $PRIMARY_KEY = '$ID';"
        done

        # Update the new column with tenant value
        echo "Updating column $COLUMN with $TENANT in table $TABLE"
        mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -e "UPDATE $TABLE SET $COLUMN = '$TENANT';"

        # Add the new column and primary key constraint
        echo "Adding primary key $COLUMN2 to table $TABLE"
        mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -e "ALTER TABLE $TABLE ADD PRIMARY KEY ($PRIMARY_KEY, $COLUMN2);"
      fi
    fi
  done

  echo "CONSOLIDATION STEPS"

  joined_string=""
  for element in "${TARGET_TABLES[@]}"
  do
    joined_string+="$element "
  done

  mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" --tables $joined_string --result-file="schema-$TENANT.sql" --no-data

  mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" --tables $joined_string --result-file="data-$TENANT.sql" --no-create-info

  echo "CREATE DATABASE IF NOT EXISTS TARGET"

  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS TARGET"

  sed -i '' 's/DEFINER=[^*]*\*/\*/g' "schema-$TENANT.sql"

  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" TARGET < "schema-$TENANT.sql"



#  # clean up
#  rm "schema-$TENANT.sql"
#  rm "data-$TENANT.sql"
#
#  # produce new schemas
#
#  mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" --result-file="schema-$TENANT.sql" --no-data
#
#  mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" --result-file="data-$TENANT.sql" --no-create-info




#  sed -i '' 's/DEFINER=[^*]*\*/\*/g' sources/"$fl"
#
#  mysql -u "$MYSQL_USER" -p="$MYSQL_PASSWORD" "$TENANT" < sources/"$fl"
#
#  mysqldump -u "$MYSQL_USER" -p="$MYSQL_PASSWORD" "t10007" --result-file="schema-$TENANT.sql" --no-data

#  for table in "${TARGET_TABLES[@]}"; do
#    statements=$(sed -n "/^CREATE TABLE \`$table\`/,/);/p" sources/"$fl")
#    INSERTS=$( echo "$statements" | grep "INSERT INTO \`$table\` VALUES")
#    INSERTS="${INSERTS%"${INSERTS##*[![:space:]]}"}"
#    # Character to search for
#    search_char=")"
#
#    replacement=",'$TENANT')"
#
#    modified="${INSERTS//$search_char/$replacement}"
#
#    replacement2="("
#
#    modified=$(echo "$modified" | sed -E "s/\([[:digit:]],/$replacement2/g")
#
#    echo "$statements" >> CONSOLIDATED_DUMP2.sql
#  done
done
