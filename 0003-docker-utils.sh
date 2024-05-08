#!/usr/bin/env bash

# script execution will fail if any of commands fails
# set -e

# docker prune (dp)
function dp(){
	info "stopping and killing all docker containers"
	docker ps -aq | xargs docker stop | xargs docker rm
}

# gitlab docker login (gdl)
function gdl(){
	# if both ENV variavles are set
	if [[ -n "$GITLAB_USERNAME" ]] && [[ -n "$GITLAB_TOKEN" ]]; then
		info "logging into gitlab docker registry"
		docker login registry.gitlab.com -u $GITLAB_USERNAME --password-stdin <<<$GITLAB_TOKEN
        return 0  
	else
		info "Please set both env variables (GITLAB_USERNAME, GITLAB_TOKEN) "
		# Return with error if env variables are not set
		return 1
	fi
}



