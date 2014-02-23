###############################################
#!/bin/bash
###############################################
# .        .                           .       
# |-..-. .-|_,. ..-.   .-..-,.-..-..-.-|-.-,.-.
# `-'`-`-`-' `'-'|-'___'  `'-|-'`-''   '-`'-'  
#                '           '                 
###############################################
# written by Thomas J. Laffoon
#
#   Finds all sites in /var/www/sites/ and reports 
# on the their filesystem/database backup file sizes.
#
###############################################
#
# Set Web Root

export sites_path="/var/www/sites/"

###############################################
# Initialize Array of Site Names

arr=( $(ls $sites_path))
site_names=${arr[@]}

###############################################
# Generate Report

# Main Header
printf "%-40s %10s %10s\n" "Website:" "Filesystem" "Database"
printf "%-40s %10s %10s\n" "`for x in {1..30}; do printf "-"; done`" "----------" "--------"

	# Iterate through each site, printing report per line.
	for x in ${site_names[@]}; do 
	  # set variables for each site as the loop iterates
      fs_backup_size=`du -hs /var/www/sites/$x/backups/filesystem | awk '{print $1}'`
      db_backup_size=`du -hs /var/www/sites/$x/backups/database | awk '{print $1}'`
		# Output 
		printf "%-40s %10s %10s\n" "$x" "$fs_backup_size" "$db_backup_size"; 
	done
