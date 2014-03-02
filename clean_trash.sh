#!/bin/bash

# This is a simple script written to clean out the trash folder on my machine for all users.  
#  It can easily be called with cron to generate clean reports and regulate the filesystem.

numDays="1"   # set the number of days to allow a file residence before deletion
path="/home"  # set /home directory of all users
users=`ls $path`   # initialize array consisting of all users in home directory 

function in_progress {  # In case you're running this command manually and deleting GBs.

dots[0]=". ."
dots[1]=" . "

  for i in "${dots[@]}"; do
        echo -ne "\b\b\b$i"
        sleep 0.1
  done
}

# Main Loop

for user in ${users[@]};
        do userTrash="$path/$user/.local/share/Trash/"
           sizeTrash=`du -hs $userTrash | awk $'{print $1}'`
                printf "Taking out the trash {$sizeTrash} for $user in [ $userTrash ] ..."
                        cleansed=`find $userTrash -type "f" -mtime $numDays -exec rm -f '{}' &> /dev/null \;`

                          until $cleansed; do
                            in_progress;
                          done

        done

        if [ $? == 0 ]; then printf " done.\n";
          else printf " error.\n"
        fi
