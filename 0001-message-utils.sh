#!/usr/bin/env bash

# script execution will fail if any of commands fails
# set -e

function err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}

function info(){
	echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*"
}

