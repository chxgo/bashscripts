#!/bin/bash
# Delete created folders by logs-order.sh script
# Written by Santiago Lunar
# santiagolunar@protonmail.com

# Firt off: Security!
set -o errexit												# Exit when a command fails
set -o nounset												# Exit when using non-declared variables

# Define variables
dockerDir="/storage/docker/"								# Container's collecting and backup logs
dirs=$("mysql" "httpd")										# Array of directories to iterate
today=$(date +%Y%m%d)										#

for i in "${dirs[@]}"; do
	if rm -rf "$dockerDir"/logs/"$i"/"$today"
		then
			printf "\n"; printf "Directory %s/logs/$i/$today deleted" "$dockerDir"; printf "\n"
		else
			printf "\n"; printf "ERROR: Directory NOT deleted\n"; printf "\n"
	fi
	if rm -rf "$dockerDir"/backups/"$i"/"$today"
		then
			printf "\n"; printf "Directory %s/backups/$i/$today deleted" "$dockerDir"; printf "\n"
		else
			printf "\n"
			printf "ERROR: Directory NOT deleted"
	fi
	aws s3 rm s3://slunarcrossover/logs/"$i"/"$today"/
	aws s3 rm s3://slunarcrossover/backups/"$i"/"$today"
done
exit
