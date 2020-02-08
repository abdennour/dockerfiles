## Custom Dockerfile
ARG UBUNTU_DESKTOP_VERSION
FROM consol/ubuntu-xfce-vnc:${UBUNTU_DESKTOP_VERSION} as ubuntu-desktop-devtools
# Switch to root user to install additional software
USER 0
## Install git
RUN apt-get update -y \
  && apt-get install -y curl git sudo \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN adduser --gecos '' --disabled-password -uid 1000 user \
  && echo "user ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
## switch back to default user

COPY docker-entrypoint /dockerstartup/
RUN chmod a+x /dockerstartup/docker-entrypoint
USER 1000
ENTRYPOINT [ "/dockerstartup/docker-entrypoint" ]