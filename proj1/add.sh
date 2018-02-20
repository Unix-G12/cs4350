#!/bin/bash
# Adding Functionality

#create and populate

NAME=":"
ADDRESS=":"
PHONE_NUMBER=":"
EMAIL=":"
minEmailCount=5 #a@a.co -> shortest possible email
minPhoneDigits=7 #555-6666
while [[ $NAME == *":"* ]]
do
  read -p "New Contact Name: " NAME
done

while [[ $ADDRESS == *":"* ]]
do
  read -p "New Contact Address: " ADDRESS
done

while [[ $PHONE_NUMBER == *":"* ]]  || [[ ${#PHONE_NUMBER} -lt $minPhoneDigits ]]
do
  read -p "New Contact Phone Number (at least 7 digits): " PHONE_NUMBER
done

while [[ $EMAIL == *":"* ]] || [[ ${#EMAIL} -lt $minEmailCount ]]
do
  read -p "New Contact E-Mail: " EMAIL
done

echo -e "Added $NAME to database!\n"

echo $NAME:$ADDRESS:$PHONE_NUMBER:$EMAIL >> database.txt
