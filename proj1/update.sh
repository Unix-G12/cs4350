#!/bin/bash
# Update functionality

DATABASE="database.txt"

echo -e "Please enter the name of the record you would like to update.\n"
read search

COUNT=$(grep -ci "${search}" ${DATABASE})

if [ ${COUNT} -gt 1 ]; then
	echo -e "More than one existing record.\n"
	echo -e "No update made!\n"
	echo -e "Try again!\n"
	./update.sh
elif [ ${COUNT} -eq 0 ]; then
	echo -e "No record of that name!\n"
	./update.sh
else
	echo -e "That record exists.\n"
	LINE=$(grep -in "${search}" ${DATABASE})
	echo $LINE
	IFS=':'
	set $LINE
	NUM=$1
	NAME=$2
	ADDRESS=$3
	PHONE_NUMBER=$4
	EMAIL=$5
fi	
	while true; do

		echo -e "What would you like to update about this record?\n"

		echo -e " (a) Name\n" "(b) Address\n" "(c) Phone Number\n" "(d) Email\n (e) Nothing\n"

		read MENU

			case $MENU in
				"a"|"A"|"1")
					read -p "Input updated Name: " NAME
					break
					;;
				"b"|"B"|"2")
					read -p "Input updated Address: " ADDRESS
					break
					;;
				"c"|"C"|"3")
					read -p "Input updated Phone Number: " PHONE_NUMBER
					break
					;;
				"d"|"D"|"4")
					read -p "Input updated Email: " EMAIL
					break
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
