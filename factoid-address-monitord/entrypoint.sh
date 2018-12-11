#!/usr/bin/env sh

set -e

envsubst < ./conf-template/config.json > ./conf/config.json

exec "$@"