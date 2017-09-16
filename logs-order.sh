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

# Sending Logs to S3 bucket
echo ""; echo "Calling directory $backup_mysql"
cd $backup_mysql
if aws s3 cp $today s3://slunarcrossover/mysql/$today $awsOptsLogs
	then
		echo "Now your logs are in AWS S3"
	else
		echo "ERROR: Your data is NOT in AWS S3"
fi
# Compress moved data into .bz2
echo ""
echo ""
echo ""
echo "Calling $backup_mysql/$today"
if cd $backup_mysql/$today
	then
		echo "Compressing data..."
		if pbzip2 -v $backup_mysql/$today/*.log
			then 
				echo "Data compressed successfully"
			else
				echo "ERROR: Data NOT compressed"
				echo "TERMINATED WITH ERRORS"
		fi					
	else
		echo "ERROR: Directory not found"
		echo "TERMINATED WITH ERRORS"
fi

# Sending compressed backups to S3 bucket
echo ""
echo "Calling directory $backup_mysql"
cd $backup_mysql
if aws s3 cp $today s3://slunarcrossover/backups/mysql/$today $awsOptsBcks"
	then
		echo "Now your backups are in AWS S3"
	else
		echo "ERROR: Your backups are NOT in AWS S3"
fi

# Sending Logs to S3 bucket
echo ""
echo "Calling directory $backup_httpd"
cd $backup_httpd
if aws s3 cp $today s3://slunarcrossover/httpd/$today $awsOptsLogs"
	then
		echo "Now your logs are in AWS S3"
	else
		echo "ERROR: Your data is NOT in AWS S3"
fi

# Compress moved data into .bz2
echo ""
echo ""
echo ""
echo ""
echo "Calling $backup_httpd/$today"
if cd $backup_httpd/$today
	then
		echo "Compressing data..."
		if pbzip2 -v $backup_httpd/$today/*.log
			then 
				echo "Data compressed successfully"
			else
				echo "ERROR: Data NOT compressed"
				echo "TERMINATED WITH ERRORS"
		fi					
	else
		echo "ERROR: Directory not found"
		echo "TERMINATED WITH ERRORS"
fi

# Sending compressed backups to S3 bucket
echo ""
echo "Calling directory $backup_httpd"
cd $backup_httpd
if aws s3 cp $today s3://slunarcrossover/backups/httpd/$today $awsOptsBcks"
	then
		echo "Now your backups are in AWS S3"
	else
		echo "ERROR: Your backups are NOT in AWS S3"
fi