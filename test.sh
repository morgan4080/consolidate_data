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

  mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" --result-file="schema-$TENANT.sql" --no-data

  mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" --result-file="data-$TENANT.sql" --no-create-info

  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "DROP DATABASE IF EXISTS $TENANT;"

  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $TENANT"

  #create tables
  mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" < "schema-$TENANT.sql"

  #alter tables to include column

  TABLES=$(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -se "SHOW TABLES;")

  for TABLE in $TABLES; do
#    mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$TENANT" -e "alter table $TABLE add $COLUMN VARCHAR(200) null;"
    echo "$TABLE"
  done



  # insert to database




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
