#!/usr/bin/env bash

# script execution will fail if any of commands fails
# set -e

function dp(){
	info "stopping and killing all docker containers"
	docker ps -aq | xargs docker stop | xargs docker rm
}


function gdl(){
	info "logging into gitlab docker registry"
	docker login registry.gitlab.com -u $GITLAB_USERNAME --password-stdin <<<$GITLAB_TOKEN
}



