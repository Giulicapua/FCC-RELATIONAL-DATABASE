#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

echo -e "\n~~~~~ Giuli's Hair Studio ~~~~~\n"

# show services
SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")
echo "$SERVICES" | while IFS="|" read SERVICE_ID SERVICE_NAME
do
echo "$SERVICE_ID) $SERVICE_NAME"
done

# read services
echo -e "\nWelcome to My Salon, how can I help you?"
read SERVICE_ID_SELECTED

# validate service
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
while [[ -z $SERVICE_NAME ]]
do
echo -e "\nI could not find that service. What would you like today?"
echo "$SERVICES" | while IFS="|" read SERVICE_ID SERVICE_NAME
do
echo "$SERVICE_ID) $SERVICE_NAME"
done
read SERVICE_ID_SELECTED
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
done

# read phone
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

# search client
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

# if non exist, ask name and add
if [[ -z $CUSTOMER_NAME ]]
then
echo -e "\nI don't have a record for that phone number, what's your name?"
read CUSTOMER_NAME
INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
fi

# read time
echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

# get customer_id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

# insert appointment 
INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

# confirmation
echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
