#!/usr/bin/env bash
#set -euo pipefail

# list all functions
lsf() {

  local dir="${1:-$HOME/.profile.d}"

  if [[ ! -d "$dir" ]]; then
    echo "ERROR: '$dir' is not a directory." >&2
    return 1
  fi

  # collect "name|comment" lines
  local entries
  entries=$(find "$dir" -type f -name '*.sh' -print0 \
    | xargs -0 awk '
      /^[[:space:]]*#/ {
        sub(/^[[:space:]]*#[[:space:]]*/, "")
        comments = comments ? comments " " $0 : $0
        next
      }
      /^[[:space:]]*[A-Za-z_][A-Za-z0-9_]*[[:space:]]*\(\)/ {
        line = $0
        sub(/\(.*/, "", line)
        sub(/^[[:space:]]*/, "", line)
        desc = comments ? comments : "(no description)"
        print line "|" desc
        comments = ""
        next
      }
      { comments = "" }
    ' \
    | sort -u)

  # emit header + underline + entries, then align on "|" 
  {
    echo "Function|Description"
    echo "--------|-----------"
    echo "$entries"
  } | column -t -s '|'
}

# If this script is run (not sourced), call laf with any args
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  laf "$@"
fi