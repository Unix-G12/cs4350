#!/bin/bash
# Update functionality
DATABASE="database.txt"
    read -p "Enter the record you would like to update: " RECORD
    namesFound=0

    while [ ! ${namesFound} -eq 1 ] ;
    do
#Check input, A-Z characters only. Rejects anything else
    if [[ "$RECORD" == [^a-zA-Z\ ] ]];
        then
            echo -e "Invalid input. Please enter characters A-Z only"
            ./update.sh
#check for multiple matches.Display matches and error message
        elif [   ]; then
#else if record is not found display message/options
        elif [   ]; then
#find line to be updated
        else

    while [   ];
    do
    echo -e "What would you like to update?\n"
    echo -e " (a) Name\n" "(b) Address\n" "(c) Phone Number\n" "(d) Email\n" "(e) Exit\n"
    read input

	case $input in
		"a"|"A"|"1")
			read -p "Input NEW name\n" NAME
                    ;;
		"b"|"B"|"2")
			read -p "Input NEW Address\n" ADDRESS
                    ;;
		"c"|"C"|"3")
			read -p "Input NEW Phone Number\n" PHONE_NUMBER
                    ;;
		"d"|"D"|"4")
			read -p "Input NEW Email\n" EMAIL
                    ;;
		"e"|"E"|"5")
                input ="5"
                    ;;
		*) echo -e '\t\t('!') INVALID CHOICE ('!')';;
	esac
  done
#Delete the orginal data. Use temp to move data
#Same thing I used in the remove function
        grep -v "${RECORD}" ${DATABASE} > temp && mv temp ${DATABASE}

#$grep -v "$var" database.txt >> updated_db.txt

        echo -e "Record has been updated!..\n"
fi
done
