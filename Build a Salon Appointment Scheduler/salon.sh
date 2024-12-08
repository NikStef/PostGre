#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo "Welcome to My Salon, how can I help you?" 
MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1 What would you like today?"
  fi

  
  # get available services
  AVAILABLE_SERVICES=$($PSQL "SELECT * FROM services ORDER BY service_id")
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
    do
      echo "$SERVICE_ID) $NAME"
    done
  # reads the user choice
  read SERVICE_ID_SELECTED

  # if input is not a number
  #if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  #then
    # send to main menu
    #MAIN_MENU "I could not find that service."
  #else
    # get the sercice by id
    SERVICE_REAL_ID=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  #fi

  # if not available
  if [[ -z $SERVICE_REAL_ID ]]
  then
    # send to main menu
    MAIN_MENU "I could not find that service."
  else
    # get customer info
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    # if customer doesn't exist
    if [[ -z $CUSTOMER_NAME ]]
    then
    # get new customer name
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME

    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
    fi
    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_REAL_ID")
    
    echo -e "\nWhat time would u like your$SERVICE_NAME,$CUSTOMER_NAME."
    read SERVICE_TIME
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(service_id, customer_id, time) VALUES('$SERVICE_REAL_ID', '$CUSTOMER_ID', '$SERVICE_TIME')") 

    echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME,$CUSTOMER_NAME."
  fi
}

MAIN_MENU