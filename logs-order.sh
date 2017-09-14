#!/bin/bash
# Ordering & backing up Docker Container's Logs
# Writter by Santiago Lunar
# santiagolunar@protonmail.com

# Define variables
log_path="/var/log/containers"
backup_path="/storage/docker/backups"							# Root directory
backup_mysql="$backup_path/mysql"							# MySQL logs dir
backup_httpd="$backup_path/httpd"							# Httpd logs dir
today="`date +%Y%m%d`"										# 
email="santiagolunar@protonmail.com"						# 

# Create directory with actual date
echo "Creating directories $backup_mysql and $backup_httpd with date"
if mkdir -p $backup_mysql/$today
	then
		echo "Directory successfully created"
	else 
		echo "ERROR: Directory not created"
		echo "TERMINATED WITH ERRORS"
fi
if mkdir -p $backup_httpd/$today
	then
		echo "Directory successfully created"
	else
		echo "ERROR: Directory not created"
		echo "TERMINATED WITH ERRORS"
fi

# Find MySQL logs and copy them from logs dirs to backups dirs
find $log_path/mysql -maxdepth 1 -name *log  -exec cp -t $backup_mysql/$today {} \;

# Sending Logs to S3 bucket
echo ""
echo "Calling directory $backup_mysql"
cd $backup_mysql
if aws s3 cp $today s3://slunarcrossover/mysql/$today --recursive --exclude "*" --include "*.log"
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
if aws s3 cp $today s3://slunarcrossover/backups/mysql/$today --recursive --exclude "*" --include "*.bz2"
	then
		echo "Now your backups are in AWS S3"
	else
		echo "ERROR: Your backups are NOT in AWS S3"
fi

# Find HTTPD logs and copy them from logs dirs to backups dirs

find $log_path/httpd -maxdepth 1 -name *log  -exec cp -t $backup_httpd/$today {} \;

# Sending Logs to S3 bucket
echo ""
echo "Calling directory $backup_httpd"
cd $backup_httpd
if aws s3 cp $today s3://slunarcrossover/httpd/$today --recursive --exclude "*" --include "*.log"
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
if aws s3 cp $today s3://slunarcrossover/backups/httpd/$today --recursive --exclude "*" --include "*.bz2"
	then
		echo "Now your backups are in AWS S3"
	else
		echo "ERROR: Your backups are NOT in AWS S3"
fi