#!/bin/bash
# Ordering & backing up Docker Container's Logs
# Written by Santiago Lunar
# santiagolunar@protonmail.com

# Define variables
log_path="/var/log/containers"
backup_path="/storage/docker/backups"						# Root directory
log_collect_path="/storage/docker/logs"						# Log's collecting dirs
dirs=$(ls $log_path)										# Directories to iterate
today="`date +%Y%m%d`"										#
aws_bucket="s3://slunarcrossover"							# AWS S3 Bucket
aws_opts_l="--recursive --exclude '*' --include '*.log'"	# AWS options for Logs uploading
aws_opts_b="--recursive --exclude '*' --include '*.bz2'"	# AWS options for Backups uploading

# Create directories with actual date
echo "Creating date directories within $backup_path and $log_collect_path"
for i in $dirs; do
	if mkdir -p $backup_path/$i/$today && mkdir -p $log_collect_path/$i/$today
		then
			echo ""
			echo "Directory $backup_path/$i/$today successfully created"
			echo ""
			echo "Directory $log_collect_path/$i/$today successfully created"
			echo ""
		else
			echo "ERROR: Directory not created"
			echo "TERMINATED WITH ERRORS"
	fi
done

# Find logs and copy them from logs dirs to Collect Log dirs
echo "Finding all Logs and copying them to Collect Log Dirs"
for i in $dirs; do
	if find $log_path/$i -maxdepth 1 -name *log  -exec cp -t $log_collect_path/$i/$today {} \;
		then
			echo ""
			echo "Log files were successfully copied to $i Collect folder"
			echo ""
		else
			echo "ERROR No files were copied to Collect folder"
	fi
done

# Compress moved data into .bz2
echo ""
echo "Compressing Logs to .bz2 and moving them to Backups folder"
for i in $dirs; do
	if pbzip2 -kv -p2 $log_collect_path/$i/$today/*.log
		then
			echo "Data compressed successfully"
			echo "Moving to backup folder..."
			if mv $log_collect_path/$i/$today/*.bz2 $backup_path/$i/$today
				then
					echo "Data moved successfully to $backup_path/$i/$today"
				else
					echo "ERROR: Data NOT moved to backup folder"
			fi
		else
			echo "ERROR: Data NOT compressed"
			echo "TERMINATED WITH ERRORS"
	fi
done

# Sending Logs and crompressed backups to S3 bucket
echo "Sending Log files and compressed backups to AWS S3 bucket"
 for i in $dirs; do
 	if aws s3 cp $log_collect_path/$i/$today $aws_bucket/logs/$i/$today $aws_opts_l && aws s3 cp $backup_path/$i/$today $aws_bucket/backups/$i/$today $aws_opts_b
 		then
 			echo "Now your logs and backups are in AWS S3"
 		else
 			echo "ERROR: Your data is NOT in AWS S3"
 	fi
 done
