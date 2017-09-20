#!/bin/bash
# Ordering & backing up Docker Container's Logs
# Written by Santiago Lunar
# santiagolunar@protonmail.com

set -o errexit												# Exit when a command fails
set -o nounset												# Exit when trying to use undeclared variables.

# Define variables
logDir="/var/log/containers" 								# Syslog container's folder
dockDir="/storage/docker"									# Backups folder
dirs=("mysql" "httpd")											# List of directories for loop iteration
today=$(date +%Y%m%d)										#
awsOptsLogs=(--recursive --exclude '*' --include '*.log')	# Options for Logs folder to AWS S3
awsOptsBcks=(--recursive --exclude '*' --include '*.bz2')	# Options fot Backups folder to AWS S3

# Create date directories under backups and logs collecting folder
printf "Creating directories with date... \n"
for i in "${dirs[@]}"; do
		if mkdir -p $dockDir/logs/"$i"/"$today" && mkdir -p $dockDir/backups/"$i"/"$today"; then
				printf "Folders %s/logs/%s/%s and $dockDir/backups/$i/$today successfully created\n" "$dockDir" "$i" "$today"
			else
				printf "ERROR: Directory not created"; printf "TERMINATED WITH ERRORS\n"
		fi
	done

# Find logs and copy them from logs folder to Log collecting folder
printf "Finding Container's Logs and copying them to Collect folder and Backups folder\n"
for i in "${dirs[@]}"; do
	if find "$logDir"/"$i" -maxdepth 1 -name '*log' -exec cp --target-directory="$dockDir/logs/$i/$today" {} \;
		then
			printf "\n"; printf "Logs have been copied to Log's collecting folder\n"; printf "\n"
		else
			printf "\n"; printf "ERROR: Logs haven't been copied\n"; printf "\n"
	fi
	if find "$logDir"/"$i" -maxdepth 1 -name '*log'  -exec cp --target-directory="$dockDir/backups/$i/$today" {} \;
		then
			printf "\n"; printf "Logs have been copied to Backups folder\n"; printf "\n"
		else
			printf "\n"; printf "ERROR: Logs haven't been copied\n"; printf "\n"
	fi
done

# Compress Logs prior to move them to AWS S3 Bucket
printf "\n"; printf "Beggining Log compressing before sending to AWS S3 Bucket\n"
for i in "${dirs[@]}"; do
	if pbzip2 --verbose $dockDir/backups/"$i"/"$today"/*.log; then
			printf "Data compressed successfully\n"
		else
			printf "ERROR: Data NOT compressed\n"
			printf "TERMINATED WITH ERRORS\n"
	fi
done

# Sending Logs and backups to AWS S3 Bucket
printf "\n"; printf "Uploading Collected Logs and *.bz2 Backups to AWS S3 Bucket\n"
for i in "${dirs[@]}"; do
	if aws s3 mv $dockDir/logs/"$i"/"$today" s3://slunarcrossover/logs/"$i"/"$today" "${awsOptsLogs[@]}" && aws s3 mv $dockDir/backups/"$i"/"$today" s3://slunarcrossover/backups/"$i"/"$today" "${awsOptsBcks[@]}"; then
			printf "Now your logs are in AWS S3\n"
		else
			printf "ERROR: Your data is NOT in AWS S3\n"
	fi
done
exit
