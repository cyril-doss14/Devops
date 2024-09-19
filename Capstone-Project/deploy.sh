#!/bin/bash

BRANCH_NAME=$1
DOCKER_DEV_REPO="cyrildoss14/dev"
DOCKER_PROD_REPO="cyrildoss14/prod"
DOCKER_IMAGE_REPO=""

if [ "$BRANCH_NAME" == "dev" ]; then
    DOCKER_IMAGE_REPO=$DOCKER_DEV_REPO
elif [ "$BRANCH_NAME" == "master" ]; then
    DOCKER_IMAGE_REPO=$DOCKER_PROD_REPO
else
    echo "Branch name does not match 'dev' or 'master'. Skipping deployment."
    exit 1
fi

docker pull $DOCKER_IMAGE_REPO:latest
docker compose down
sed -i "s|image:.*|image: $DOCKER_IMAGE_REPO:latest|g" docker-compose.yml
docker compose up -d
