#!/bin/bash
# Ordering & backing up Docker Container's Logs
# Written by Santiago Lunar
# santiagolunar@protonmail.com

set -o errexit												# Exit when a command fails
set -o nounset												# Exit when trying to use undeclared variables.

Host=10.0.0.213
BDir=/media/backup1/srv213/mysql/

Dump="mysqldump --skip-extended-insert --force --lock-all-tables"
MySQL="/usr/bin/mysql"

Today=$(date "+%d-%b-%Y")

# Obtener una lista de las bases de datos
Databases=$(echo "SHOW DATABASES" | $MySQL -h $Host -u respaldos)


for db in $Databases; do
        date=`date`
        file="$BDir/$Today/$db.sql.gz"
        echo "Backing up '$db' from '$Host' on '$date' to: "
        echo "   $file"
#        $Dump -h $Host $db | gzip > $file
done
