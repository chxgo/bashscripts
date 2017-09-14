#!/bin/bash
# Delete created folders by logs-order.sh script
# Writter by Santiago Lunar
# santiagolunar@protonmail.com

# Define variables
backup_path="/storage/docker/backups"						# Root directory
log_collect_path="/storage/docker/logs"						# Log's collecting dirs
dirs=$(ls $backup_path)										# Directories to iterate	
today="`date +%Y%m%d`"										#

for i in $dirs; do
	if rm -rf $backup_path/$i/$today
		then
			echo ""
			echo "Directory $backup_path/$i/$today deleted"
			echo ""
		else
			echo ""
			echo "Directory NOT deleted"
			echo ""
	fi
	if rm -fr $log_collect_path/$i/$today
		then
			echo ""
			echo "Directory $log_collect_path/$i/$today deleted"
			echo ""
		else
			echo ""
			echo "Directory NOT deleted"
	fi
	aws s3 rm s3://slunarcrossover/logs/$i/$today/
	aws s3 rm s3://slunarcrossover/backups/$i/$today
done