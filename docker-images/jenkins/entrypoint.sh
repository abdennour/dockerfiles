#!/bin/bash
set -e

# When a DOCKER_GID_ON_HOST is supplied, run jenkins with this
# group id - to access the docker socket shared via volume
dockerGroupName=""
if [ -n "$DOCKER_GID_ON_HOST" ]; then

  echo "Create group for gid $DOCKER_GID_ON_HOST"
  sudo groupadd -g $DOCKER_GID_ON_HOST docker && sudo grpconv
  sudo usermod -a  -G $DOCKER_GID_ON_HOST jenkins
  dockerGroupName=$(cat /etc/group | grep :$DOCKER_GID_ON_HOST: | cut -d: -f1)

fi;

#-----
for i in "$@"
do
case $i in
    -p=*|--plugins=*)
    plugins="${i#*=}"
    shift # past argument=value
    ;;

    --dry-run)
    dry_run=yes
    shift # past argument with no value
    ;;   
    *)
          # unknown option
    ;;
esac
done


if [ ! -z "${plugins}" ]; then

  echo "installing plugins ${plugins}: ..."

  /usr/local/bin/install-plugins.sh $(echo ${plugins} | sed "s/,/ /g")

fi;

echo PLUGINS ${plugins};

# ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
cmdLine=$(/sbin/tini -- /usr/local/bin/jenkins.sh "$@")	
if [ -n "$dockerGroupName" ]; then 
  exec sg $dockerGroupName "$cmdLine"
else
  exec $cmdLine
fi
