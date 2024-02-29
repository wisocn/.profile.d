#!/usr/bin/env bash

# script execution will fail if any of commands fails
# set -e

function dp(){
	info "stopping and killing all docker containers"
	docker ps -aq | xargs docker stop | xargs docker rm
}



