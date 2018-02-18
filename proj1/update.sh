#!/bin/bash
# Update functionality

DATABASE="database.txt"

echo -e "Please enter the name of the record you would like to update.\n"
read search

LINE=$(grep -in "${search}" ${DATABASE})
echo $LINE
IFS=':'
set $LINE
NUM=$1
NAME=$2
ADDRESS=$3
PHONE_NUMBER=$4
EMAIL=$5

while true; do

	echo -e "What would you like to update about this record?\n"

	echo -e " (a) Name\n" "(b) Address\n" "(c) Phone Number\n" "(d) Email\n (e) Exit\n"

	read MENU

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
				echo -e "Exiting\n"
 				break
				;;
			*) 
				echo "INVALID CHOICE"
				;;	
		esac
		done
		MENU=' '

	grep -v "${search}" ${DATABASE} > temp && mv temp ${DATABASE}

	echo "$NAME:$ADDRESS:$PHONE_NUMBER:$EMAIL" >> ${DATABASE}


	echo -e "Updating existing record.\n"

	IFS=' '

done 
