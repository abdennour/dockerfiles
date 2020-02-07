## Custom Dockerfile
ARG UBUNTU_DESKTOP_VERSION
FROM consol/ubuntu-xfce-vnc:${UBUNTU_DESKTOP_VERSION} as ubuntu-desktop-devtools
# Switch to root user to install additional software
USER 0
## Install git
RUN apt-get update -y \
  && apt-get install -y curl git \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

## switch back to default user
USER 1000
