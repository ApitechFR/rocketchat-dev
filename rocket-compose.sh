#!/bin/bash

# Exit immediately on error
set -e

# RocketChat directory
ROCKET_DIR_RELATIVE="$PWD"
ROCKET_DIR=$(realpath $ROCKET_DIR_RELATIVE)

# Get Meteor version/release from file
METEOR_RELEASE=$(cat ${ROCKET_DIR}/apps/meteor/.meteor/release)
METEOR_RELEASE_ARRAY=(${METEOR_RELEASE//@/ })
METEOR_VERSION=$(echo ${METEOR_RELEASE_ARRAY[1]})

# Export necessary variables
export METEOR_VERSION=$METEOR_VERSION
export ROCKET_DIR=$ROCKET_DIR

# Run the docker-compose command
echo "Running docker-compose $@ ... for RocketChat DEV"
echo "-- Meteor version : ${METEOR_VERSION}"
echo "-- Rocket directory : ${ROCKET_DIR}"
docker-compose -f ${RCD_PATH}/local/docker-compose.yml $@
