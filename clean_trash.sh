#!/bin/bash

# This is a simple script written to clean out the trash folder on my machine for all users.  
#  It can easily be called with cron to generate clean reports and regulate the filesystem.

numDays="1"   # set the number of days to allow a file residence before deletion
path="/home"  # set /home directory of all users
arrUsers=`ls $path`   # initialize array consisting of all users in home directory 

# Main Loop

for user in ${arrUsers[@]};
	do userTrash="$path/$user/.local/share/Trash/"
	printf "Taking out the trash for $user..."
	find $userTrash -type "f" -mtime $numDays -exec rm -f '{}' &> /dev/null \;

	  if [ $? == 0 ]; then printf " done.\n";
	    else printf " error.\n" 
	  fi

	done
