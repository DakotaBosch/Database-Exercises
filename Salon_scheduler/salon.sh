#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -c"

services=($($PSQL "SELECT array(select name from services);"))
echo $($PSQL "\copy (select name from services) to 'services.csv';")

echo ${services[2]}

echo ${services[@]}
readarray arr -t a < services.csv

echo ${arr[@]}

echo -e '\n~~~~~ MY SALON ~~~~~\n'
echo -e 'Welcome to My Salon, how can I help you?\n'

for i in 1 2 3
do
	printf $i') '
	echo ${arr[i-1]}
done	

read service_id

while [ $service_id -lt 1 ] || [ $service_id -gt 3 ]
do
	echo -e '\nI could not find that service. What would you like today?'
	for i in 1 2 3
	do 
		printf $i')'
		echo ${arr[i-1]}
	done
	read service_id
done

echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

#if phone number unique 
#then 
echo -e "\nI don't have a record for that phone number, what's your name?"
read CUSTOMER_NAME
#else set CUSTOM_NAME

echo -e '\nWhat time would you like your cut,' $CUSTOMER_NAME '?'
read SERVICE_TIME

echo -e '\nI have put you down for a cut at' $SERVICE_TIME', '$CUSTOMER_NAME'.'
