#!/bin/bash
# Update functionality

echo -e "What would you like to update?\n"

echo -e " (a) Name\n" "(b) Address\n" "(c) Phone Number\n" "(d) Email\n"

read input

	case $input in
		"a"|"A"|"1")
			read -p "Input current Name\n" NAME
			if [grep -F "$NAME"]; then 
				read -p "What would you like to change it to?\n" new_var
			else
				echo "No one by that name in this database.\n"
			fi;;
		"b"|"B"|"2")
			read -p "Input current Address\n" ADDRESS
			if [grep -F "$ADDRESS"]; then 
				read -p "What would you like to change it to?\n" new_var
			else
				echo "No one with that address in this database.\n"
			fi;;
		"c"|"C"|"3")
			read -p "Input current Phone Number\n" PHONE_NUMBER
			if [grep -F "$PHONE_NUMBER"]; then 
				read -p "What would you like to change it to?\n" new_var
			else
				echo "No one with that phone number in this database.\n"
			fi;;
		"d"|"D"|"4")
			read -p "Input current Email\n" EMAIL
			if [grep -F "$NAME"]; then 
				read -p "What would you like to change it to?\n" new_var
			else
				echo "No one with that email in this database.\n"
			fi;;
			break;;
		*) echo -e '\t\t('!') INVALID CHOICE ('!')';;	
	esac

#$grep -v "$var" database.txt >> updated_db.txt

echo -e "updating existing record..\n"
