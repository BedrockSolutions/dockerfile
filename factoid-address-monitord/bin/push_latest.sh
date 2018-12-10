#!/usr/bin/env bash

NAMESPACE='bedrocksolutions'
IMAGE_NAME='factoid-address-monitord'
TAG='latest'

set -xe

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

cd ${SCRIPT_DIR}/..

docker build -t ${IMAGE_NAME}:${TAG} -t ${NAMESPACE}/${IMAGE_NAME}:${TAG} .

docker push ${NAMESPACE}/${IMAGE_NAME}:${TAG}
