#!/usr/bin/env bash

# script execution will fail if any of commands fails
# set -e

# author https://gist.githubusercontent.com/franzbecker/b4bb77f66d36472548bf/raw/4be1f6f48fecd15016161cdca5a79e53c9a2433e/gradle.bash
function gwb(){
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
