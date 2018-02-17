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
minPhoneDigits=7
until [[ $fields =~ ^[a-d]*$ ]]
	do 
    clear
    echo -e "Which contact fields would you like to search?\nEnter up to 4 choices with no spaces (e.g. abd) \n";
    echo -e " (a) Full Name \n (b) Address \n (c) Phone Number \n (d) E-Mail \n";
    read -p "Enter choice: " fields
done

for (( f=0; f<${#fields}; f++));
	do
	#choice=$f
	choice=${fields:$f:1}
	case $choice in
		"a"|"A"|"1")
            while [[ $NAME == *":"* ]]
            	do
                read -p "Search for contact name: " NAME
            done;;

		"b"|"B"|"2")
            while [[ $ADDRESS == *":"* ]]
                do
                read -p "Search for contact address: " ADDRESS
                done;;

		"c"|"C"|"3")
            while [[ $PHONE_NUMBER == *":"* ]]  || [[ ${#PHONE_NUMBER} -lt $minPhoneDigits ]]
                do
                read -p "Search for contact phone number (at least ${minPhoneDigits} digits): " PHONE_NUMBER
                done;;
                
		"d"|"D"|"4")
            while [[ $EMAIL == *":"* ]] || [[ ${#EMAIL} -lt $minEmailCount ]]
            #while [[ $EMAIL == *":"* ]]
                do
                read -p "Search for contact email: " EMAIL
                done;;
	esac
done

contactInfo=$(grep -i "$NAME" database.txt | grep -i "$ADDRESS" | grep -i "$PHONE_NUMBER" | grep -i "$EMAIL")

if [[ ${#contactInfo} != 0 ]]
	then

	OIFS=$IFS
	IFS="
	"
	count2=0
	for this in $contactInfo
	do
	    IFS=":"
	    read -ra x <<< "${this}"
	    read -ra x <<< "$this"

	if ([ "$NAME" == ":" ] || [ "$NAME" == "${x[count2]}" ]) && ([ "$ADDRESS" == ":" ] || [ "$ADDRESS" == "${x[count2+1]}" ]) && ([ "$PHONE_NUMBER" == ":" ] || [ "$PHONE_NUMBER" == "${x[count2+2]}" ]) && ([ "$EMAIL" == ":" ] || [ "$EMAIL" == "${x[count2+3]}" ])
	then
	    echo -e "-----------------------------\nContact Information\n"
	    echo "Name: ${x[count2]}"
	    echo "Address: ${x[count2+1]}"
	    echo "Phone Number: ${x[count2+2]}"
	    echo "Email: ${x[count2+3]}"
	    echo -e "-----------------------------\n"
	else
	    echo -e "Contact not found. Please enter full name and/or address.\n"
	fi
	IFS="
	"
	done
	IFS=$OIFS

else
	echo -e "Error: One or more fields did not exist in the database.\nTry simplying your search.\n";	
fi




# #!/bin/bash
# # Record Searching

# NAME=":"
# ADDRESS=":"
# PHONE_NUMBER=":"
# EMAIL=":"
# line1=":"
# fields="x"
# input=""
# minEmailCount=5
# minPhoneDigits=7
# until [[ $fields =~ ^[a-d]*$ ]]
# 	do 
#     clear
#     echo -e "Which contact fields would you like to search?\nEnter up to 4 choices with no spaces (e.g. abd) \n";
#     echo -e " (a) Name \n (b) Address \n (c) Phone Number \n (d) E-Mail \n";
#     read -p "Enter choice: " fields
# done

# for (( f=0; f<${#fields}; f++));
# 	do
# 	#choice=$f
# 	choice=${fields:$f:1}
# 	case $choice in
# 		"a"|"A"|"1")
#             while [[ $NAME == *":"* ]]
#             	do
#                 read -p "Search for contact name: " NAME
#             done;;

# 		"b"|"B"|"2")
#             while [[ $ADDRESS == *":"* ]]
#                 do
#                 read -p "Search for contact address: " ADDRESS
#                 done;;

# 		"c"|"C"|"3")
#             while [[ $PHONE_NUMBER == *":"* ]]  || [[ ${#PHONE_NUMBER} -lt $minPhoneDigits ]]
#                 do
#                 read -p "Search for contact phone number (at least ${minPhoneDigits} digits): " PHONE_NUMBER
#                 done;;
                
# 		"d"|"D"|"4")
#             while [[ $EMAIL == *":"* ]] || [[ ${#EMAIL} -lt $minEmailCount ]]
#             #while [[ $EMAIL == *":"* ]]
#                 do
#                 read -p "Search for contact email: " EMAIL
#                 done;;
# 	esac
# done

# contactInfo=$(grep -i "$NAME" database.txt | grep -i "$ADDRESS" | grep -i "$PHONE_NUMBER" | grep -i "$EMAIL")

# if [[ ${#contactInfo} != 0 ]]
# 	then

# 	OIFS=$IFS
# 	IFS="
# 	"
# 	count=0
# 	for this in $contactInfo
# 	do
# 	#echo "COUNT: $count"
# 	    IFS=":"
# 	    read -ra x <<< "${this}"
# 	    read -ra x <<< "$this"
# 	#count=${#x[@]}
# 	#count2=0
# 	#while [[ $count2 -lt $count ]]
# 	#do
# 		echo -e "-----------------------------\nContact Information\n"
# 	    echo "Name: ${x[count2]}"
# 	    echo "Address: ${x[count2+1]}"
# 	    echo "Phone Number: ${x[count2+2]}"
# 	    echo "Email: ${x[count2+3]}"
# 	    echo -e "-----------------------------\n"
# 	#count2=$count2+4
# 	#done
# 	IFS="
# 	"
# 	done
# 	IFS=$OIFS

# else
# 	echo -e "Error: One or more fields did not exist in the database.\nTry simplying your search.\n";	
# fi

# # TODO
# # check for multiple entries, if so prompt for unique identifer (email)
