#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -q -c"
PSQLq="psql -U freecodecamp -d salon -t --no-align -c"
services=( $($PSQLq "select name from services;") )
id=( $($PSQLq "select service_id from services;") )
phone=( $($PSQLq "select phone from customers;") )
len=${#services[@]}

echo -e '\n~~~~~ MY SALON ~~~~~\n'
echo -e 'Welcome to My Salon, how can I help you?\n'

for (( i=1; i-1 < $len; i++ )) 
do
	printf ${id[i-1]}') '
	echo ${services[i-1]}
done	

read SERVICE_ID_SELECTED

while [[ "${id[@]}" != *"$SERVICE_ID_SELECTED"* ]]
do
	echo -e '\nI could not find that service. What would you like today?'
	for (( i=1; i-1 < $len; i++))
	do 
		printf ${id[i-1]}') '
		echo ${services[i-1]}
	done
	read SERVICE_ID_SELECTED
done

echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

if [[ "${phone[@]}" != *"$CUSTOMER_PHONE"* ]]; then 
	echo -e "\nI don't have a record for that phone number, what's your name?"
	read CUSTOMER_NAME
	echo $($PSQL "insert into customers(name, phone) values ('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")
else	
	CUSTOMER_NAME=( $($PSQLq "select name from customers where phone = '$CUSTOMER_PHONE';") )
fi

echo -e '\nWhat time would you like your cut,' ${CUSTOMER_NAME[@]} '?'
read SERVICE_TIME

CUSTOMER_ID=( $($PSQLq "select customer_id from customers where name = '$CUSTOMER_NAME';") )
echo $($PSQL "insert into appointments (service_id, customer_id, time) values($SERVICE_ID_SELECTED,$CUSTOMER_ID,'$SERVICE_TIME');")

echo -e '\nI have put you down for a cut at' $SERVICE_TIME', '$CUSTOMER_NAME'.'
