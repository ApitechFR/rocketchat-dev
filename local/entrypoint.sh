#!/bin/bash

RC_MESSAGE="Start building (the first build can take 10 or more minutes, and you may see various warnings or minor errors -- please be patient; subsequent dev builds after the first will be 5 minutes or less)"
#
BASE_DIR='/usr/src/app'
APP_DIR="${BASE_DIR}/apps/meteor"

echo "[RocketChat] Starting..."
echo ${RC_MESSAGE}

# Install app dependencies
cd ${APP_DIR}
echo "[RocketChat] Running 'meteor yarn install' in ${APP_DIR}"
meteor yarn install

# Build the project
cd ${BASE_DIR}
echo "[RocketChat] Running 'meteor yarn build' in ${BASE_DIR}"
meteor yarn build

# Run the app
cd ${APP_DIR}
echo "[RocketChat] Running 'meteor yarn dev' in ${APP_DIR}"
echo ${RC_MESSAGE}
meteor yarn dev