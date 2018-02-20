#!/bin/bash
# CS4350 Project 1 Menu Interface

while true;
do
	echo -e "\nWelcome to Contact Database!\n***************************"
	echo -e " (a) Add Record\n" "(b) Search record\n" "(c) Update record\n" "(d) Remove Record\n" "(e) Display Entire Database (Admin Only)\n (f) Exit\n"
	read -p "Enter choice: " choice

	case $choice in
		"a"|"A"|"1")
			./add.sh;;
		"b"|"B"|"2")
			./search.sh;;
		"c"|"C"|"3")
			./update.sh;;
		"d"|"D"|"4")
			./remove.sh;;
		"e"|"E"|"5")
			./display.sh;;
		"f"|"F"|"6")
			echo -e "Exiting Contact Database.."
			break;;
		*) echo -e '\t\t('!') INVALID CHOICE ('!')';;
	esac
done