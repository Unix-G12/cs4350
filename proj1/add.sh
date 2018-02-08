#!/bin/bash
# Adding Functionality

#check if db.txt exists & otherwise create and populate

echo -e "let's add a record!\n";

NAME=":"
ADDRESS=":"
PHONE_NUMBER=":"
EMAIL=":"

while [[ $NAME == *":"* ]]
do
  echo Name cannot contain a colon
  echo What is your name?
  read NAME
done

while [[ $ADDRESS == *":"* ]]
do
  echo Address cannot contain a colon
  echo What is your address?
  read ADDRESS
done

while [[ $PHONE_NUMBER == *":"* ]]
do
  echo Phone number cannot contain a colon
  echo What is your phone number?
  read PHONE_NUMBER
done

while [[ $EMAIL == *":"* ]]
do
  echo Email cannot contain a colon
  echo What is your email?
  read EMAIL
done

echo $NAME:$ADDRESS:$PHONE_NUMBER:$EMAIL >> database.txt
