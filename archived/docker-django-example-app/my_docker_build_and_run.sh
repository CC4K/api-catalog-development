#!/bin/bash

APP_VERSION="1.0"
APP_NAME="my-application-1"

docker rm --force ${APP_NAME}-${APP_VERSION}
docker build --tag ${APP_NAME}:${APP_VERSION} .

# Run in detached mode and setup persistent storage
docker run --detach \
  --name ${APP_NAME}-${APP_VERSION} \
  --volume /home/cedric_k/Desktop/docker-example-app/output:/app/output \
  --volume /home/cedric_k/Desktop/docker-example-app/logs:/app/logs \
  ${APP_NAME}:${APP_VERSION}

docker image ls ${APP_NAME}

docker ps --filter "name=${APP_NAME}_${APP_VERSION}"
