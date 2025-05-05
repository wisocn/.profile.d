#!/usr/bin/env bash

# script execution will fail if any of commands fails
# set -e

# gradle wrapper build
gwb(){
	if [ -f gradlew ]; then 
		./gradlew $@
	else 
		# if there is no ./gradlew check if there is a build.gradle file
		# if not ask the user for confirmation (avoid creation of .gradle dir in unrelated directories)
		if [ -f build.gradle ]; then
			gradle $@
		else		
			read -n1 -p "There is no build.gradle in this directory. Do you want to continue? [y,n]" doit
			case $doit in  
				y|Y) gradle $@ ;; 
			esac
		fi
	fi
} 
