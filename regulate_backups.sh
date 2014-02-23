#!/bin/bash

for x in `ls $sites_path`; 
	do 	sitename="$x"
		backup_location="/var/www/sites/$sitename/backups/database/"
		backups_remaining=`ls $backup_location | wc -l`
		backup_size=`du -hs $backup_location | awk '{print $1}'`
		
		echo "  $backups_remaining backup(s) remain for $sitename" ;

			if [[ $backups_remaining -gt 1 ]]; then 
				echo "  Backups stored for $sitename are taking up $backup_size." ;
				echo "  Removing excess backup files..." ;
				find $backup_location -type f -atime +30 -exec rm '{}' \;
				echo ""

			elif [[ $backups_remaining -lt 1 ]]; then
				echo "  No backups found for $sitename!  Running database backup now..." ;
				bash /var/www/sites/$sitename/.system/backup.sh data	
				echo ""
			
			elif [[ $backups_remaining -eq 1 ]]; then
				echo "  Backups stored for $sitename are taking up $backup_size." ;
				echo "  All clear." && echo "";
			fi

	done
