#!/usr/bin/env bash

# script execution will fail if any of commands fails
# set -e

ff() {
    echo "PWD IS ${PWD}"
    find . -type f -iname "*$1*"

}


