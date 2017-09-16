#!/bin/bash
# Ordering & backing up Docker Container's Logs
# Writter by Santiago Lunar
# santiagolunar@protonmail.com

# Define variables
logDir="/var/log/containers" 								# Syslog container's folder
dockDir="/storage/docker"									# Backups folder
dirs=$(ls -d $logDir/*/)									# Directories for loop iteration
today="`date +%Y%m%d`"										# 
awsOptsLogs="--recursive --exclude '*' --include '*.log'"	# Options for Logs folder to AWS S3
awsOptsBcks="--recursive --exclude '*' --include '*.bz2'"	# Options fot Backups folder to AWS S3

# Create date directories under backups and logs collecting folder
echo "Creating directories with date..."
for i in $dirs
	do
		if mkdir -p $dockDir/logs/$i/$today && mkdir -p $dockDir/backups/$i/$today
			then
				echo "Folders $bcksDir/logs/$i/$today \n
				     and $dockDir/backups/$i/$today \n
				     successfully created"
			else 
				echo "ERROR: Directory not created"; echo "TERMINATED WITH ERRORS"
		fi
	done

# Find logs and copy them from logs folder to Log collecting folder
echo "Finding Container's Logs and copying them to Collect folder and Backups folder"
for i in $dirs; do
	if find $logDir/$i -maxdepth 1 -name *log  -exec cp -t $dockDir/logs/$i/$today {} \;
		then; 
			echo ""; echo "Logs have been copied to Log's collecting folder"; echo ""
		else
			echo ""; echo "ERROR: Logs haven't been copied"; echo ""
	fi
	if find $logDir/$i -maxdepth 1 -name *log  -exec cp -t $dockDir/backups/$i/$today {} \;
		then
			echo ""; echo "Logs have been copied to Backups folder"; echo ""
		else
	fi		echo ""; echo "ERROR: Logs haven't been copied"; echo ""
done

# Compress Logs prior to move them to AWS S3 Bucket
echo ""; echo "Beggining Log compressing before sending to AWS S3 Bucket"
for i in $dirs; do
	if pbzip2 -v $dockDir/backups/$i/$today
		then 
			echo "Data compressed successfully"
		else
			echo "ERROR: Data NOT compressed"; echo "TERMINATED WITH ERRORS"
	fi
done

# Sending Logs and backups to AWS S3 Bucket
echo ""; echo "Uploading Collected Logs and *.bz2 Backups to AWS S3 Bucket"
for i in $dirs; do
	if aws s3 mv $dockDir/logs/$i/$today s3://slunarcrossover/logs/$i/$today $awsOptsLogs && if aws s3 mv $dockDir/backups/$i/$today s3://slunarcrossover/backups/$i/$today $awsOptsBcks
	then
		echo "Now your logs are in AWS S3"
	else
		echo "ERROR: Your data is NOT in AWS S3"
fi