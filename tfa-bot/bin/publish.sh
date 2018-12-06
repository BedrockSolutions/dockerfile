#!/usr/bin/env bash

set -xe

while [[ "$#" > 0 ]]; do case $1 in
  -t|--tag) tag="${2}"; shift;;
  -h|--help) echo "${0} --tag <tag>"; exit 0;;
  *) echo "Unknown parameter passed: $1"; exit 1;;
esac; shift; done

if [ -z "${tag}" ]; then echo "The 'tag' parameter is required" && exit 1; fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

cd ${SCRIPT_DIR}/..

docker build -t bedrocksolutions/tfa-bot:${tag} -t bedrocksolutions/tfa-bot:latest .

docker push bedrocksolutions/tfa-bot
