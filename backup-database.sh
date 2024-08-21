#!/bin/bash

path="/home/ubuntu/backup-db/"     # Path where the backup of your database
nameBackup=""                     # Environment where it is hosted
mysqlUser=""                             # Your MySQL user
mysqlPass=""                       # Your MySQL password
mysqlDatabase=""                     # The name of your database

TIMER="$(date +'%d-%m-%Y-%Hh-%Mm-%Ss')"


if [[ -z "$mysqlUser" || -z "$mysqlPass" || -z "$mysqlDatabase" ]]; then
    echo "Please fill in username, password and database in settings."
else
    # Create the backup
    mysqldump -u$mysqlUser -p$mysqlPass $mysqlDatabase > $path"/"$nameBackup"-"$TIMER".sql"

    # Change to the backup directory
    cd $path

    # Remove older backups if there are more than 10 files
    backups=($(ls -t $nameBackup-*.sql))
    if (( ${#backups[@]} > 10 )); then
        for file in "${backups[@]:10}"; do
            rm "$file"
        done
    fi

    echo "Backup Complete."
fi