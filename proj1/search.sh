#!/bin/bash
# Record Searching

echo -e "searching for a record..\n";

NAME=":"
ADDRESS=":"
PHONE_NUMBER=":"
EMAIL=":"
line1=":"

while [[ $NAME == *":"* ]]
do
echo Name cannot contain a colon
echo Enter name or hit enter to enter address
read NAME
done

while [[ $ADDRESS == *":"* ]]
do
echo Address cannot contain a colon
echo Enter address or hit enter to to enter phone number
read ADDRESS
done

while [[ $PHONE_NUMBER == *":"* ]]
do
echo Phone number cannot contain a colon
echo Enter phone number or hit enter to enter email
read PHONE_NUMBER
done

while [[ $EMAIL == *":"* ]]
do
echo Email cannot contain a colon
echo Enter email ot hit enter
read EMAIL
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
