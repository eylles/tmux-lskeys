#!/bin/sh

# Usage: rstrip "string" "pattern"
rstrip() {
    printf '%s\n' "${1%%$2}"
}

myname="${0##*/}"

PLUGIN_DIR=$(rstrip "$0" "/${myname}")
# echo "$PLUGIN_DIR"


table='prefix'
key='?'

tmux bind-key -T "$table" "$key" run-shell -b "${PLUGIN_DIR}/lskeys.sh"
