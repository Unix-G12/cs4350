DATABASE="database.txt"
PASS=p@ssword

read -s -p "Enter password:" PASS1
    if [ "$PASS1" == "$PASS" ];
        then
            echo
            echo "Showing database.."
            echo
            column -t -s ":" $DATABASE;
        else
            echo "Invalid Password!"
            ./db_menu.sh
fi