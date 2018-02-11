#!/bin/bash
# Update functionality

echo -e "What would you like to update?\n"

echo -e " (a) Name\n" "(b) Address\n" "(c) Phone Number\n" "(d) Email\n"

read input

	case $input in
		"a"|"A"|"1")
			read -p "Input current Name\n" var;;
		"b"|"B"|"2")
			read -p "Input current Address\n" var;;
		"c"|"C"|"3")
			read -p "Input current Phone Number\n" var;;
		"d"|"D"|"4")
			read -p "Input current Email\n" var;;
			break;;
		*) echo -e '\t\t('!') INVALID CHOICE ('!')';;
	
	esac
		
read -p "What would you like to change it to?\n" new_Input	

sed 's/$var/$new_Input/' database.txt

echo -e "updating existing record..\n"
