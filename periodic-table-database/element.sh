#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

ARG=$1

# if no argument, fail
if [ -z "$ARG" ]; then
  echo "Please provide an element as an argument."
  exit
fi

# build query depending on argument type
QUERY=""
if [[ "$ARG" =~ ^[0-9]+$ ]]; then
  QUERY="SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius
         FROM elements
         JOIN properties USING(atomic_number)
         JOIN types USING(type_id)
         WHERE atomic_number=$ARG"
else
  QUERY="SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius
         FROM elements
         JOIN properties USING(atomic_number)
         JOIN types USING(type_id)
         WHERE symbol='$ARG' OR name='$ARG'"
fi

# run query
ELEMENT=$($PSQL "$QUERY")

# if nothing found
if [ -z "$ELEMENT" ]; then
  echo "I could not find that element in the database."
  exit
fi

# split row into variables
read ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELTING BOILING <<< "$(echo "$ELEMENT" | tr '|' ' ')"

# print line
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
