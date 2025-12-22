#!/bin/bash

set -euo pipefail

# Script description goes here

confirm() {
    read -p "$1 (y/n) " -n 1 -r
    echo
    [[ $REPLY =~ ^[Yy]$ ]]
}

main() {
	

    echo "This program will backup your existing .bashrc and .profile"
    echo "This will make it work with my (suspicious-cheese) home-manager setup"

    if [[ -f ~/.bashrc.backup || -f ~/.bashrc.local || -f ~/.profile.local ]]; then
		echo "one or more backups/local file(s) already exists. pls fix"
		exit 1
	else
	
	    if confirm "Back up .bashrc and also rename .bashrc to .bashrc.local and rename .profile to .profile.local "; then
	    	if [ -f ~/.bashrc ]; then
	        	echo "Backing up .bashrc"
	        	cp -n ~/.bashrc ~/.bashrc.backup
	        	
	        	echo "Renaming .bashrc to .bashrc.local"
	        	mv -n ~/.bashrc ~/.bashrc.local
			
	    	else
	        	echo "Warning: ~/.bashrc doesn't exist"
			fi
		
			if [ -f ~/.profile ]; then
			
				echo "Renaming .profile"
				mv -n ~/.profile ~/.profile.local
			
			else
				echo ".profile doesn't exist, this is probably not bad but just double check if it actually doesn't exist"
			fi
		
			
		
	    else
	        	echo "Cancelled"
	        	exit 1
	    fi
	fi
}

main "$@"
