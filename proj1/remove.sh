#!/bin/bash
#Author : Maria Sanchez
# Remove functionality

DATABASE="database.txt"

read -p " Enter the name to be removed: " REMOVE

#Find name to be removed
LINE=$(grep -inm 1 -e "${REMOVE}" ${DATABASE})
if [ "$LINE" != " " ];
    then
        RECORDS=$(grep -ci "${REMOVE}" ${DATABASE})
fi

#Check input, A-Z characters only. Rejects anything else
if [[ "$REMOVE" == [^a-zA-Z\ ] ]];
    then
        echo -e " Invalid input. Please enter characters A-Z only "
        ./remove.sh
#./remove.sh , is optional. We could give the user
#the option to quit or search again for every error.
fi

#Check for ALL records with same name and display error message
if [ $RECORDS ] && [ $RECORDS -gt 1 ];
    then
        echo -e " \nERROR: Multiple records were found. "
        echo -e " --------------------------------------------------- "
#Display all records found for users input
#We could get rid of this because privacy laterrr
#If people happen to have the same first and last name
#We could also add an option to delete by email, phone etc..
        grep -i "${REMOVE}" ${DATABASE}
        echo -e " --------------------------------------------------- "
        echo -e " \nPlease try again and enter a last name.\n "
        ./remove.sh
        RECORDS=''

#delete line from the file
elif [ "$LINE" != "" ];
    then
        grep -v "${REMOVE}" ${DATABASE} > temp && mv temp ${DATABASE}
        echo -e " \nRecord has been removed\n "
    else
        echo -e " ERROR: No record was found. "
        echo -e " Try again!\n "
        ./remove.sh
fi

