#!/bin/bash
# Author : Maria Sanchez
# Remove functionality

DATABASE="database.txt"
MULTIPLE_FOUND="FALSE"
REMOVE_EMAIL=":"
read -p "Enter the name to be removed: " REMOVE_NAME

#Find name to be removed
LINE=$(grep -inm 1 -e "${REMOVE_NAME}" ${DATABASE})
if [ "$LINE" != " " ];
    then
        RECORDS=$(grep -ci "${REMOVE_NAME}" ${DATABASE})
fi

#Check input, A-Z characters only. Rejects anything else
if [[ "$REMOVE_NAME" == [^a-zA-Z\ ] ]];
    then
        echo -e " Invalid input. Please enter characters A-Z only "
        ./remove.sh
#./remove.sh , is optional. We could give the user
#the option to quit or search again for every error.
fi
#Check for ALL records with same name and display error message
if [ $RECORDS ] && [ $RECORDS -gt 1 ];
    then
        MULTIPLE_FOUND="TRUE"
        echo -e "{!}  ERROR: Multiple records were found. {!}"
        #read -p "Please specify the contact's email: " REMOVE_EMAIL
        while [[ $REMOVE_EMAIL == *":"* ]] || [[ ${#REMOVE_EMAIL} -lt $minEmailCount ]]
        do
            read -p "Please specify the email for the contact you'd like to remove: " REMOVE_EMAIL
        done
        LINE=$(grep -w "${REMOVE_EMAIL}" ${DATABASE})
fi
echo "line: $LINE"
# remove line with matching credential
if [ "$LINE" != "" ]; then
    if [ "$MULTIPLE_FOUND" = "TRUE" ]; then
        grep -v "${REMOVE_EMAIL}" ${DATABASE} > temp && mv temp ${DATABASE}
        echo -e " \nRecord successfully removed according to email ($REMOVE_EMAIL).\n "
    else
        grep -v "${REMOVE_NAME}" ${DATABASE} > temp && mv temp ${DATABASE}
        echo -e " \nRecord successfully removed according to name ($REMOVE_NAME).\n "
    fi;
else
        echo -e " ERROR: No record was found. "
        echo -e " Try again!\n "
        ./remove.sh
fi

