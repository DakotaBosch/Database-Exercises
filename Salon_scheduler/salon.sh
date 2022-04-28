#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -c"
PSQLq="psql -t --csv -U freecodecamp -d salon -c"
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

read service_id

while [ $service_id -lt 1 ] || [ $service_id -gt $len ]
do
	echo -e '\nI could not find that service. What would you like today?'
	for (( i=1; i-1 < $len; i++))
	do 
		printf ${id[i-1]}')'
		echo ${services[i-1]}
	done
	read service_id
done

echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

if [[ "$phone" != *"$CUSTOMER_PHONE"* ]]; then 
	echo -e "\nI don't have a record for that phone number, what's your name?"
	read CUSTOMER_NAME
	echo $($PSQL "insert into customers(name, phone) values ('$CUSTOMER_NAME', $CUSTOMER_PHONE);")
else 
	CUSTOMER_NAME=( $($PSQLq "select name from customers where phone = $CUSTOMER_PHONE;") )
fi

echo -e '\nWhat time would you like your cut,' $CUSTOMER_NAME '?'
read SERVICE_TIME

CUSTOMER_ID=( $($PSQLq "select customer_id from customers where name = '$CUSTOMER_NAME';") )
echo $($PSQL "insert into appointments (service_id, customer_id) values($service_id,$CUSTOMER_ID);")

echo -e '\nI have put you down for a cut at' $SERVICE_TIME', '$CUSTOMER_NAME'.'
