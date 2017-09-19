#!/bin/bash
# Ordering & backing up Docker Container's Logs
# Written by Santiago Lunar
# santiagolunar@protonmail.com

set -o errexit												# Exit when a command fails
set -o nounset												# Exit when trying to use undeclared variables.

host="10.0.0.213"
dbDir="/media/backup1/srv213/mysql/"

dumpOpts="--skip-extended-insert --force --lock-all-tables"
mysql="/usr/bin/mysql"

today=$(date "+%d-%b-%Y")

# Obtener una lista de las bases de datos
printf "Obtener una lista completa de las bases de datos\n"
dbs=$(echo "SHOW DATABASES" | $mysql -h $host -u respaldos)


for i in $dbs; do
        date=$today
        file="$dbDir/$today/$i.sql.gz"
        printf "Backing up '$i' from '$host' on '$date' to:\n"
        printf "$file\n"
        mysqldump $dumpOpts -h $Host $db | gzip > $file
done
exit
