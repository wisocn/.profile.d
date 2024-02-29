#!/usr/bin/env bash

# script execution will fail if any of commands fails
# set -e

function kp(){
	if [[ $# -eq 0 ]] ; then
    info "Arguments not set. Please set the name of process you would like to kill"
    return 0
	fi

	fp $1 | xargs -r -n1 kill -9 > /dev/null 2>&1 
	info "Killed all process for input $1"
}

function fp(){
	 pgrep -fi $1 | awk '{print $1}'
}

# vim:shiftwidth=2 softtabstop=2 expandtab
# EOF

