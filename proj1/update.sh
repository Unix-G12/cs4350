#!/bin/bash
# Update functionality

DATABASE="database.txt"
MULTIPLE_FOUND="FALSE"
minEmailCount=5
MENU_OPTION="x"
read -p "Please enter the name of the record you would like to update: " search_name

COUNT=$(grep -ci "${search_name}" ${DATABASE})

if [ ${COUNT} -gt 1 ]; then
	read -p "Found more than one matching record. Please enter contact's email: " search_email
	MULTIPLE_FOUND="TRUE"
elif [ ${COUNT} -eq 0 ]; then
	echo -e "Could not find matching record. Please input full name.\n"
	./update.sh
else #single contact found
	LINE=$(grep -i "${search_name}" ${DATABASE})
	echo -e "---\nFound contact\n $LINE\n---"
	IFS=':'
	set $LINE
	#NUM=$1
	#NAME=$2
	#ADDRESS=$3
	#PHONE_NUMBER=$4
	#EMAIL=$5
	NAME=$1
	ADDRESS=$2
	PHONE_NUMBER=$3
	EMAIL=$4
fi	

if [ "$MULTIPLE_FOUND" = "TRUE" ]; then
	LINE=$(grep -i "${search_email}" ${DATABASE})
	echo -e "---\nFound contact\n$LINE\n---"
	IFS=':'
	set $LINE
	#NUM=$1
	#NAME=$2
	#ADDRESS=$3
	#PHONE_NUMBER=$4
	#EMAIL=$5
	NAME=$1
	ADDRESS=$2
	PHONE_NUMBER=$3
	EMAIL=$4
fi

until [[ $MENU_OPTION =~ ^[a-e]*$ ]]
do 
	echo -e "What would you like to update about this record?\nEnter up to 4 choices with no spaces (e.g. bcd)\n"
	echo -e " (a) Name\n" "(b) Address\n" "(c) Phone Number\n" "(d) Email\n (e) Nothing\n"

	read -p "Choice: " MENU_OPTION
done
for ((m=0; m<${#MENU_OPTION}; m++));
do
	choice=${MENU_OPTION:$m:1}
	case $choice in

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
			MENU_OPTION="x"
			break
			;;
		*) 
	esac
done

if [ "$MULTIPLE_FOUND" = "FALSE" ];
then	
	#echo "Removing all instances of contact with name: ${search_name}"	
	grep -v "${search_name}" ${DATABASE} > temp && mv temp ${DATABASE}
else
	#echo "Removing all instances of contact with name: ${search_email}"	
	grep -v "${search_email}" ${DATABASE} > temp && mv temp ${DATABASE}

fi

echo -e "$NAME:$ADDRESS:$PHONE_NUMBER:$EMAIL" >> ${DATABASE}	
#echo "updated field to be appended: $NAME:$ADDRESS:$PHONE_NUMBER:$EMAIL"	
echo -e "Updating existing record.\n"
IFS=' '
