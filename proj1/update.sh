#!/bin/bash
# Update functionality

DATABASE="database.txt"
MULTIPLE="FALSE"
minEmailCount=5
MENU="x"
read -p "Please enter the name of the record you would like to update: " search

COUNT=$(grep -ci "${search}" ${DATABASE})

if [ ${COUNT} -gt 1 ]; then
	read -p "Found more than one matching record. Please enter contact's email: " UPDATE_EMAIL

elif [ ${COUNT} -eq 0 ]; then
	echo -e "Could not find matching record. Please input full name.\n"
	./update.sh
else
	echo -e "Contact found:"
	LINE=$(grep -i "${search}" ${DATABASE})
	echo -e "$LINE\n"
	IFS=':'
	set $LINE
	NUM=$1
	NAME=$2
	ADDRESS=$3
	PHONE_NUMBER=$4
	EMAIL=$5
fi	

while true; 
do

until [[ $MENU =~ ^[a-e]*$ ]]
do 

	echo -e "What would you like to update about this record?\nEnter up to 4 choices with no spaces (e.g. bcd)"

	echo -e " (a) Name\n" "(b) Address\n" "(c) Phone Number\n" "(d) Email\n (e) Nothing\n"

	read -p "Choice: " MENU
done
for ((m=0; m<${#MENU}; m++)); do
	case $MENU in
		"a"|"A"|"1")
			read -p "Input updated Name: " NAME
			;;
		"b"|"B"|"2")
			read -p "Input updated Address: " ADDRESS
			;;
		"c"|"C"|"3")
			read -p "Input updated Phone Number: " PHONE_NUMBER
			;;
		"d"|"D"|"4")
			read -p "Input updated Email: " EMAIL
			;;
		"e"|"E"|"5")
			echo -e "Database unchanged.\n"
			./db_menu.sh
			break
			;;
		*) 
	esac
done		
	grep -v "${search}" ${DATABASE} > temp && mv temp ${DATABASE}

	echo "$NAME:$ADDRESS:$PHONE_NUMBER:$EMAIL" >> ${DATABASE}	

	echo -e "Updating existing record.\n"
	IFS=' '
	MENU=' '
done 
