#!/bin/bash

MYSQL_USER="root"
MYSQL_PASSWORD="2fpLxthn"
COLUMN="tenant_id"

TARGET_TABLES=("b_region" "b_branch")

SOURCES=$(ls sources/)

SOURCE_FILES=()

INITIAL_INDEX=0

for file in $SOURCES; do
  SOURCE_FILES[INITIAL_INDEX]="$file"
  INITIAL_INDEX=$((INITIAL_INDEX+1))
done

for fl in "${SOURCE_FILES[@]}"; do
  TENANT=$(cat sources/"$fl" | grep "Database:" | awk '{ print $5 }')

  echo "$TENANT"

  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $TENANT"

  sed -i '' 's/DEFINER=[^*]*\*/\*/g' sources/"$fl"

  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" < sources/"$fl"

#  mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" --result-file="schema-$TENANT.sql" --no-data
#
#  mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" --result-file="data-$TENANT.sql" --no-create-info
#
#  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "DROP DATABASE IF EXISTS $TENANT;"
#
#  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $TENANT"
#
#  #create tables
#  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" < "schema-$TENANT.sql"
#  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" < "data-$TENANT.sql"

  #alter tables to include column

  TABLES=$(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -se "SHOW TABLES;")

  OLD_PRIMARY_KEY="_ID"

  NEW_PRIMARY_KEY=$TENANT$OLD_PRIMARY_KEY

  for TABLE in $TABLES; do
    IS_BASE_TABLE=$(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -se "SELECT COUNT(*) FROM information_schema.VIEWS WHERE TABLE_NAME = '$TABLE';")
    if [ "$IS_BASE_TABLE" -eq 0 ]; then
      mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -e "alter table $TABLE add $COLUMN VARCHAR(10) null;"
      mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -e "alter table $TABLE add $NEW_PRIMARY_KEY VARCHAR(10) null;"
      OLD_PRIMARY_KEY=$(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -se "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME = '$TABLE' AND CONSTRAINT_NAME = 'PRIMARY';")
      IDS=$(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -se "SELECT $OLD_PRIMARY_KEY FROM $TABLE;")

      for ID in $IDS; do
        mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -e "UPDATE $TABLE SET $NEW_PRIMARY_KEY = '$TENANT$ID' WHERE $OLD_PRIMARY_KEY=$ID;"
      done

#      echo "$IDS"



#      mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -e "UPDATE $TABLE SET $NEW_PRIMARY_KEY = '$TENANT$IDS' WHERE $OLD_PRIMARY_KEY=$IDS;"
#      for ID in $IDS; do
#        echo "$NEW_PRIMARY_KEY '$TENANT$ID' $OLD_PRIMARY_KEY $ID"
#      done
    fi
  done

  for TABLE in $TABLES; do
      IS_BASE_TABLE=$(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -se "SELECT COUNT(*) FROM information_schema.VIEWS WHERE TABLE_NAME = '$TABLE';")
      if [ "$IS_BASE_TABLE" -eq 0 ]; then
        mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -e "UPDATE $TABLE SET $COLUMN = '$TENANT';"
      fi
  done

  mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" --result-file="schema-$TENANT.sql" --no-data

  mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" --result-file="data-$TENANT.sql" --no-create-info


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
