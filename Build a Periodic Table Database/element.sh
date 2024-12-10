#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

#echo "Please provide an element as an argument."

argument=$1

PERIODIC_TABLE(){

case $argument in
    # Check if the argument is a single character or a number
    ?)
        if [[ $argument =~ ^[0-9]+$ ]]
        then
        atomic=$argument
        else
        SINGLE_CHARACTER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$argument'")
        atomic=$SINGLE_CHARACTER
        fi
        ;;

    # Check if the argument is two characters or 2 numbers
    ??)
        if [[ $argument =~ ^[0-9]+$ ]]
        then
        atomic=$argument
        else
        DOUBLE_CHARACTERS=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$argument'")
        atomic=$DOUBLE_CHARACTERS
        fi
        ;;

    # Check if the argument is 3 digits
    ???)
    TRIPLE_DIGITS=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$argument'")
    atomic=$TRIPLE_DIGITS
    ;;

    # Check if the argument is an string of characters
    '' | *[!0-9]*)
        NAME_CHARACTERS=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$argument'")
        atomic=$NAME_CHARACTERS
        ;;

    # If none of the above
    *)  
        #TODO with and if to inform the user that the number he tried to find it doesnt exists,e.g. 4digits long atomic number 
        atomic=-1
        ;;
esac





SPECIFIC_ELEMENT=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $atomic")
#when we havent impement the specific elements
if [[ -z $SPECIFIC_ELEMENT ]]
then
  echo "I could not find that element in the database."
else
  echo "$SPECIFIC_ELEMENT" | while IFS='|' read  TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius." 
    done
fi
}

#if an arguments doesnt exist it stops it
if [ -n "$argument" ]; 
then
  PERIODIC_TABLE
else
  echo "Please provide an element as an argument."
fi