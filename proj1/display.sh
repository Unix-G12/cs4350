DATABASE="database.txt"
PASS=mariaisawesome

read -s -p "Enter password:" PASS1
    if [ "$PASS1" == "$PASS" ];
        then
            echo
            echo "Showing database.."
            echo
            cat $DATABASE ;
        else
            echo "Invalid Password!"
            ./db_menu.sh
fi





