#!/bin/bash
# Ordering & backing up Docker Container's Logs
# Written by Santiago Lunar
# santiagolunar@protonmail.com

set -o errexit												# Exit when a command fails
set -o nounset												# Exit when trying to use undeclared variables.

host="10.0.0.213"
dbDir="/media/backup1/srv213/mysql/"

dumpOpts="--skip-extended-insert --force --lock-all-tables"
MySQL="/usr/bin/mysql"

Today=$(date "+%d-%b-%Y")

# Obtener una lista de las bases de datos
Databases=$(echo "SHOW DATABASES" | $MySQL -h $Host -u respaldos)


for db in $Databases; do
        date=`date`
        file="$BDir/$Today/$db.sql.gz"
        echo "Backing up '$db' from '$Host' on '$date' to: "
        echo "   $file"
        mysqldump $dumpOpts -h $Host $db | gzip > $file
done
