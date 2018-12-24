#!/usr/bin/env sh

set -e

{
  while true; do
    inotifywait -m ~/.factom/private -e close_write |
      while read path action file; do
        echo "inotifywait: ${action} event on ${path}${file}"
        if [ -f "~/.factom/private/factomd.conf" ] ; then
          envsubst < ~/.factom/private/factomd.conf > ~/.factom/private-conv/factomd.conf
        fi
      done
  done
} &

envsubst < ~/.factom/private/factomd.conf > ~/.factom/private-conv/factomd.conf

exec /go/bin/factomd "$@"
