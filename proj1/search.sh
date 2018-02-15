#!/bin/bash
# Record Searching

NAME=":"
ADDRESS=":"
PHONE_NUMBER=":"
EMAIL=":"
line1=":"
fields="x"
input=""
minEmailCount=5
until [[ $fields =~ ^[a-d]*$ ]]
	do 
    clear
    echo -e "Which contact fields would you like to search?\n(*) Enter up to 4 choices with no spaces (e.g. abd) (*) \n";
    echo -e " (a) Name \n (b) Address \n (c) Phone Number \n (d) E-Mail \n";
    read -p "Enter choice: " fields
done

for f in $fields 
	do
	#choice=$f
	#echo -e "${#fields} \n";
	case $f in
		"a"|"A"|"1")
            while [[ $NAME == *":"* ]]
            	do
                echo "Search for contact name: "
                read NAME
            done;;

		"b"|"B"|"2")
            while [[ $ADDRESS == *":"* ]]
                do
                echo "Search for contact address: "
                read ADDRESS
                done;;

		"c"|"C"|"3")
            while [ $PHONE_NUMBER == *":"* ]  && [ ${#PHONE_NUMBER} -gt 7 ]
                do
                echo "Search for contact phone number: " 
                read PHONE_NUMBER
                done;;
                
		"d"|"D"|"4")
            #while [[ $EMAIL == *":"* ] && [ ${#EMAIL} -lt $minEmailCount ]]
            while [[ $EMAIL == *":"* ]]
                do
                echo "Search for contact email: "
                read EMAIL
                done;;
	esac
done
line1=$(grep -i "$NAME" database.txt | grep -i "$ADDRESS" | grep -i "$PHONE_NUMBER" | grep -i "$EMAIL")

OIFS=$IFS
IFS="
"
count=0
for this in $line1
do
#echo "COUNT: $count"
    IFS=":"
    read -ra x <<< "${this}"
    read -ra x <<< "$this"
#count=${#x[@]}
#count2=0
#while [[ $count2 -lt $count ]]
#do
    echo "Name: ${x[count2]}"
    echo "Address: ${x[count2+1]}"
    echo "Phone Number: ${x[count2+2]}"
    echo "Email: ${x[count2+3]}"
    echo
#count2=$count2+4
#done
IFS="
"
done
IFS=$OIFS
