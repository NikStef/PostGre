#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guessing_game -t --no-align -c"

COUNTER=1
let COUNTER++

echo "Enter your username:"

read USERNAME

GAME(){

USERNAME_ID=$($PSQL "SELECT username_id FROM usernames WHERE username='$USERNAME'")
#if user doesn't exists
if [[ -z $USERNAME_ID ]]
then
  INSERT_GAMER=$($PSQL "INSERT INTO usernames(username) VALUES('$USERNAME')") 
  USERNAME_ID=$($PSQL "SELECT username_id FROM usernames WHERE username='$USERNAME'")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(guesses) FROM games WHERE username_id=$USERNAME_ID")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE username_id=$USERNAME_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

CORRECT_NUMBER=$(( ( RANDOM % 1000 )  + 1 ))

#counter for guesses
COUNTER=0
echo "Guess the secret number between 1 and 1000:"
echo -e "\nReady for your First Guess\n"

while [[ ! $GUESS = $CORRECT_NUMBER ]]
do 
  read GUESS
  #if input is  not an integer
  while [[ ! $GUESS =~ ^[0-9]+$ ]]
  do
    echo -e "That is not an integer, guess again:\n"
    read GUESS
  done

  if (( $GUESS > $CORRECT_NUMBER ))
  then
    echo -e "It's lower than that, guess again:\n"
    
  else
    echo -e "It's higher than that, guess again:\n"
  fi
  let COUNTER++
done

#insert game in database
INSERT_GAME=$($PSQL "INSERT INTO games(username_id, guesses) VALUES($USERNAME_ID, $COUNTER)")

echo -e "\nYou guessed it in $COUNTER tries. The secret number was $CORRECT_NUMBER. Nice job!\n"

}



if [[ ${#USERNAME} -gt 22 ]]
then
  echo -e "\nYour username is too big. This game accepts usernames maximum of 22 characters.\n"
else
  GAME
fi