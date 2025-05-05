#!/usr/bin/env bash

# script execution will fail if any of commands fails
# set -e

# docker prune (dp)
dp(){
	docker ps -aq | xargs docker stop | xargs docker rm
	info "stopped and killed all docker containers"
}

# docker tag list
dtl(){

	# Ensure jq is installed
	if ! command -v jq &> /dev/null; then
		echo "jq is required for this script to work. Please install jq."
		exit 1
	fi

	if [ -z "$1" ]; then
		echo "Usage: dtl <image_name>"
		return 1
	fi

	image=$1
	page_size=${2:-10}
	response=$(curl -s "https://registry.hub.docker.com/v2/repositories/library/$image/tags?page_size=$page_size")
	
	if echo "$response" | grep -q "errors"; then
		echo "Error fetching tags for image: $image"
		return 1
	fi

 	tags=$(echo "$response" | jq -r '.results[] | "\(.name) \(.last_updated) \(.full_size)"')
  	max_tag_length=0

	while read -r tag last_updated size; do
		tag_length=${#tag}
		if (( tag_length > max_tag_length )); then
		max_tag_length=$tag_length
		fi
	done <<< "$tags"

  	(( column_width = max_tag_length + 5 ))

	echo "Top 5 latest tags for $image:"
	printf "%-${column_width}s %-30s %-10s\n" "TAG" "LAST UPDATED" "SIZE (MB)"
	printf "%-${column_width}s %-30s %-10s\n" "----" "-------------" "---------"

	echo "$tags" | while read -r tag last_updated size; do
		size_mb=$(echo "scale=2; $size / 1024 / 1024" | bc)
		printf "%-${column_width}s %-30s %-10s\n" "$tag" "$last_updated" "$size_mb"
	done
}

# docker list with grep
dl(){
	
  # Check if any arguments were passed
  if [ $# -eq 0 ]; then
			docker ps -a 
      return 0  # Return with error if no arguments are provided
  fi

	docker ps -a | grep $1
}

# docker prune all (dpa) stop and remove all images
dpa(){
	export -f dp
	dp && docker rmi -f $(docker images -aq)
	info "removed all docker images"
}

# gitlab docker login (gdl)
gdl(){
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



