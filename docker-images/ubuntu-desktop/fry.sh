#!/bin/bash
###  @author Abdennour
########################
# Container Env Vars:
#  -e DOCKER_GID_ON_HOST = DOCKER_GID_ON_HOST=$(cat /etc/group | grep docker: | cut -d: -f3)
#  -e SSH_PRIVATE_KEY_B64 = Base64PrivateKey
set -e

# If given, ansible user has to be a member in the group.
dockerGroupName=""
if [ -n "$DOCKER_GID_ON_HOST" ]; then

  echo "Create group for gid $DOCKER_GID_ON_HOST"
  sudo groupadd -g $DOCKER_GID_ON_HOST docker && sudo grpconv
  sudo usermod -a  -G $DOCKER_GID_ON_HOST ansible
  dockerGroupName=$(cat /etc/group | grep :$DOCKER_GID_ON_HOST: | cut -d: -f1)

fi;

# Initiate SSH keys to initialize ~/.ssh directory
pvkey=${HOME}/.ssh/id_rsa
cat /dev/zero | ssh-keygen -q -N "" -f ${pvkey} -P "" ;

if [ -n "${SSH_PRIVATE_KEY_B64}" ]; then
  echo -n "${SSH_PRIVATE_KEY_B64}" | base64 -d > ${pvkey};
  rm -f ~/.ssh/id_rsa.pub;
fi

if [ -n "$dockerGroupName" ]; then 
  exec sg $dockerGroupName "$@"
else
  exec $@
fi