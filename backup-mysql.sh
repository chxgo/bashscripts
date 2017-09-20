#!/bin/bash
# Backup each database to gzip files
# Written by Santiago Lunar
# santiagolunar@protonmail.com

# First off: security!

set -o errexit												# Exit when a command fails
set -o nounset												# Exit when trying to use undeclared variables.

# Define variables
host="10.0.0.213"                                           # The host where the databases are
dbDir="/media/backup1/srv213/mysql/"                        # Folder to allocate compressed backups
dumpOpts="--skip-extended-insert --force --lock-all-tables" # Options for mysqldump
mysql="/usr/bin/mysql"                                      # MySQL executable path
today=$(date "+%d-%b-%Y")
user="respaldos"                                            # The MySQL user for backups

# Let's begin
printf "Getting a complete list of databases...\n"
dbs=$(echo "SHOW DATABASES" | $mysql -h $host -u $user)     # Get a complete list of DBs

printf "Beggining database backup and compression...\n"
for i in $dbs; do
    file="$dbDir/$today/$i.sql.gz"                          # Stablish backup name
    printf "Backing up %s from %s on %s to: $dbDir/$today/$i.sql.gz\n" "$i" "$host" "$today"
    printf "%s\n" "$file"
    mysqldump "$dumpOpts" -h "$host" "$i" | gzip > "$file"          # Dump and compression of databases
done

exit
