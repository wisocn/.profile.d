#!/usr/bin/env bash

# script execution will fail if any of commands fails
# set -e

ff() {
    # Check if any arguments were passed
    if [ $# -eq 0 ]; then
        echo "No Arguments specified. Please provide files to search."
        return 1  # Return with error if no arguments are provided
    fi

  find . -type f -iname "*$1*"
}

daf() {
  # make fr available to subshells
  export -f fr
  ff $1 | xargs -L 1 -I {} bash -c 'fr "$@"' _ {}
}

fr() {
    # Check if any arguments were passed
    if [ $# -eq 0 ]; then
        echo "No files specified. Please provide files to remove."
        return 1  # Return with error if no arguments are provided
    fi

    # Iterate over all arguments passed to the function
    for file in "$@"; do
        if [ -f "$file" ]; then  # Check if the file exists and is a regular file
            rm "$file"  # Remove the file
            if [ $? -eq 0 ]; then  # Check if rm command was successful
                echo "Removed file: $file"
            else
                echo "Failed to remove file: $file"
            fi
        else
            echo "File not found or is not a regular file: $file"
        fi
    done
}

