#!/bin/bash
#Author : Maria Sanchez
#Remove functionality


DATABASE="database.txt"

read -p " Enter the name to be removed: " REMOVE
LINE=$(grep -inm 1 -e "${REMOVE}" ${DATABASE})

if [ "$LINE" != " " ];
    then
        RECORDS=$(grep -ci "${REMOVE}" ${DATABASE})
    if [[ "$REMOVE" == [^a-zA-Z\ ] ]];
        then
            echo -e " Invalid input. Please enter characters A-Z only "
            ./db_menu.sh
    fi
fi

if [ $RECORDS ] && [ $RECORDS -gt 1 ];
    then
        echo -e " \nERROR: Multiple records were found. "
        echo -e " \nPlease try again and enter a last name.\n "
        read -p " Enter the email to be removed: " EMAIL
        LINE=$(grep -inm 1 -e "${EMAIL}" ${DATABASE})
    if [[ "$EMAIL" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$ ]]
        then
            grep -v "${EMAIL}" ${DATABASE} > temp && mv temp ${DATABASE}
            echo -e " \nRecord for "$EMAIL" has been removed\n "
        else
            echo -e "No record was found!"
            ./db_menu.sh
    fi
elif [ "$LINE" != "" ];
    then
        grep -v "${REMOVE}" ${DATABASE} > temp && mv temp ${DATABASE}
        echo -e " \nRecord for "$REMOVE" has been removed\n "
    else
        echo -e "No record was found!"
        ./db_menu.sh
fi

