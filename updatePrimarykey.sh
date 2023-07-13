#!/bin/bash

# MySQL database credentials
DB_HOST="localhost"
MYSQL_USER="root"
MYSQL_PASSWORD="2fpLxthn"
DB_NAME="TARGET"
EXCLUDED_TABLES=("c_loan_payment_schedule_allocations_fees")

SCHEMAS=$(ls schema/)

SCHEMA_FILES=()

# Collect schema file names
for file in $SCHEMAS; do
  SCHEMA_FILES+=("$file")
done

for fl in "${SCHEMA_FILES[@]}"; do
  echo "CREATE DATABASE IF NOT EXISTS TARGET"

  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS TARGET"

  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" TARGET -e "SET FOREIGN_KEY_CHECKS=0;"

  sed -i '' 's/DEFINER=[^*]*\*/\*/g' "./schema/$fl"

  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" TARGET < "./schema/$fl"
done


SOURCES=$(ls data/)
SOURCE_FILES=()

# Collect source file names
for file in $SOURCES; do
  SOURCE_FILES+=("$file")
done

# GET TABLES FROM TARGET DATABASE

# Process each table in the schema
TABLES=$(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$DB_NAME" -se "SHOW TABLES;")

for fl in "${SOURCE_FILES[@]}"; do
# Print the table names
  TENANT=$(cat data/"$fl" | grep "Database:" | awk '{ print $5 }')
  TENANT=$(echo "$TENANT" | sed 's/t//g')
  echo "Tenant: $TENANT"
  for TABLE in $TABLES; do
      IS_BASE_TABLE=$(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$DB_NAME" -se "SELECT COUNT(*) FROM information_schema.VIEWS WHERE TABLE_NAME = '$TABLE';")
      if [ "$IS_BASE_TABLE" -eq 0 ]; then

        excluded=false
        for excluded_table in "${EXCLUDED_TABLES[@]}"; do
            if [[ "$TABLE" == "$excluded_table" ]]; then
                excluded=true
                break
            fi
        done

        if [[ "$excluded" == false ]]; then
            statements=$(sed -n "/^INSERT INTO \`$TABLE\` /,/);/p" data/"$fl")
            INSERTS=$( echo "$statements" | grep "INSERT INTO \`$TABLE\` VALUES")
            INSERTS="${INSERTS%"${INSERTS##*[![:space:]]}"}"
            search_char="("
            replacement="($TENANT"

            modified="${INSERTS//$search_char/$replacement}"

#            sed -E "s/\([[:digit:]],/$replacement2/g" data/"$fl"

        else
            echo "Skipping excluded table: $TABLE"
        fi
      fi
  done
done
















