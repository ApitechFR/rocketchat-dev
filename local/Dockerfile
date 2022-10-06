#####
# RocketChat DEV image
# @see https://developer.rocket.chat/rocket.chat/rocket-chat-environment-setup/linux
# @see https://developer.rocket.chat/rocket.chat/rocket-chat-environment-setup/windows-10
#####

ARG METEOR_VERSION

# Use an image with meteor already there
FROM geoffreybooth/meteor-base:${METEOR_VERSION}

# Update packages and install required tools
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install -y build-essential git curl python3-minimal pkg-config

# Define work directory
WORKDIR /usr/src/app/apps/meteor

# Install yarn
RUN meteor npm install --global yarn

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]