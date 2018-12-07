#!/usr/bin/env bash

NAMESPACE='bedrocksolutions'
IMAGE_NAME='tfa-bot-slim'

set -xe

while [[ "$#" > 0 ]]; do case $1 in
  -t|--tag) TAG="${2}"; shift;;
  -h|--help) echo "${0} --tag <tag>"; exit 0;;
  *) echo "Unknown parameter passed: $1"; exit 1;;
esac; shift; done

if [ -z "${TAG}" ]; then echo "The 'tag' parameter is required" && exit 1; fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

cd ${SCRIPT_DIR}/..

docker build -t ${NAMESPACE}/${IMAGE_NAME}:${TAG} -t ${NAMESPACE}/${IMAGE_NAME}:latest .

docker push ${NAMESPACE}/${IMAGE_NAME}
