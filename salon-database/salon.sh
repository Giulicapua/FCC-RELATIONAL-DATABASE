#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

echo -e "\n~~~~~ Giuli Buzzed & Beautiful ~~~~~\n"

# grab all services
SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

# print the menu
echo "$SERVICES" | while read -r ROW; do
  ID=$(echo "$ROW" | cut -d'|' -f1)
  NAME=$(echo "$ROW" | cut -d'|' -f2)
  echo "$ID) $NAME"
done

# pick service
echo -e "\nWelcome to My Salon, how can I help you?"
read SERVICE_ID_SELECTED

# validate loop
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
while [ -z "$SERVICE_NAME" ]; do
  echo -e "\nI could not find that service. What would you like today?"
  echo "$SERVICES" | while read -r ROW; do
    ID=$(echo "$ROW" | cut -d'|' -f1)
    NAME=$(echo "$ROW" | cut -d'|' -f2)
    echo "$ID) $NAME"
  done
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
done

# phone 
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

if [ -z "$CUSTOMER_NAME" ]; then
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  $PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')" > /dev/null
fi

# appointment time
echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

$PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')" > /dev/null

echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
