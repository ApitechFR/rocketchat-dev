#!/bin/bash -i

# Exit immediately on error
set -e

TOOL_NAME="rocketchat-dev"
TOOL_CMD="rocket-compose"

ROOT_PATH=/usr/local/lib/
USER_PATH=/home/$USER/tools

#####
echo "[${TOOL_NAME}] Checking requirements..."
#
declare -a reqs=("git" "docker-compose")
for i in "${reqs[@]}"
do
  if ! [ -x "$(command -v $i)" ]
    then
        echo "[${TOOL_NAME}] Missing required tool : $i !"
        exit 1
  fi
done
#
echo "[${TOOL_NAME}] All required tools are there."
#####

#####
echo "[${TOOL_NAME}] Determining installation folder..."
#
if [ "$EUID" -ne 0 ]
  then
    # Installation folder for normal users
    INSTALL_FOLDER="${USER_PATH}/${TOOL_NAME}"
  else
    # Installation folder for root user
    INSTALL_FOLDER="${ROOT_PATH}/${TOOL_NAME}"    
fi
#
echo "[${TOOL_NAME}] Installation will be done in ${INSTALL_FOLDER}."
#####

#####
echo "[${TOOL_NAME}] Creating installation folder..."
#
mkdir -p ${INSTALL_FOLDER}
cd ${INSTALL_FOLDER}
#
echo "[${TOOL_NAME}] Created installation folder."
#####

#####
echo "[${TOOL_NAME}] Downloading files..."
git clone https://github.com/ApitechFR/rocketchat-dev .
echo "[rocketchat-dev] Downloaded files."
#####

#####
echo "[${TOOL_NAME}] Registering the alias..."
#
echo "alias ${TOOL_CMD}=${INSTALL_FOLDER}/rocket-compose.sh" >> ~/.bashrc
#
echo "[${TOOL_NAME}] Registered alias. Use 'source ~/.bashrc' to get it."
#####