#!/bin/bash
# Adding Functionality

#create and populate

NAME=":"
ADDRESS=":"
PHONE_NUMBER=":"
EMAIL=":"

while [[ $NAME == *":"* ]]
do
  read -p "New Contact Name: " NAME
done

while [[ $ADDRESS == *":"* ]]
do
  read -p "New Contact Address: " ADDRESS
done

while [[ $PHONE_NUMBER == *":"* ]]
do
  read -p "New Contact Phone Number: " PHONE_NUMBER
done

while [[ $EMAIL == *":"* ]]
do
  read -p "New Contact E-Mail: " EMAIL
done

echo $NAME:$ADDRESS:$PHONE_NUMBER:$EMAIL >> database.txt
