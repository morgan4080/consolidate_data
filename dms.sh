#!/bin/bash

TARGET_TABLES=(b_region b_branch)

SOURCES=$(ls sources/)

SOURCE_FILES=()

INITIAL_INDEX=0

for file in $SOURCES; do
  SOURCE_FILES[INITIAL_INDEX]="$file"
  INITIAL_INDEX=$((INITIAL_INDEX+1))
done

for fl in "${SOURCE_FILES[@]}"; do
  for table in "${TARGET_TABLES[@]}"; do
    statements=$(sed -n "/^CREATE TABLE \`$table\`/,/);/p" sources/"$fl")
    TENANT=$(cat sources/"$fl" | grep "Database:" | awk '{ print $5 }')
    INSERTS=$(cat "$statements" | grep "INSERT INTO \`$table\` VALUES")
    INSERTS="${INSERTS%"${INSERTS##*[![:space:]]}"}"

    # Character to search for
    search_char=")"

    replacement=",'$TENANT')"

    modified="${INSERTS//$search_char/$replacement}"

    replacement2="("

    modified=$(echo "$modified" | sed -E "s/\([[:digit:]],/$replacement2/g")

    echo -e "$modified \n" >> CONSOLIDATED_DUMP2.sql
  done
done
