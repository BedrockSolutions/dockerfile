#!/usr/bin/env sh

set -e

envsubst < /home/factomd/.factom/private/factomd.conf > /home/factomd/.factom/private-conv/factomd.conf

exec /go/bin/factomd "$@"
