https://www.packer.io/docs/builders/docker.html
https://github.com/moby/moby/issues/3378


# Availables Image Groups : 

## abdennour/aws

```sh
# basic example
docker run --rm \
  -v "${HOME}/.aws:/root/.aws" \
  abdennour/aws aws s3 ls

```

## abdennour/docker`

```sh
# basic example
docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  abdennour/docker:19-dind docker images

# docker + aws
docker run --name docker-aws --rm -d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "${HOME}/.aws:/root/.aws" \
  abdennour/docker:19-dind-aws1.16.246 tail -f /dev/null

docker exec docker-aws sh -c '$(aws ecr get-login --no-include-email --region us-west-1)';
docker exec docker-aws docker pull xxxxxxxx.dkr.ecr.us-west-1.amazonaws.com

```

## abdennour/eksctl`

```sh
# basic example
docker run --rm \
  -v "${HOME}/.aws:/root/.aws" \
  abdennour/eksctl create cluster ...
```

## abdennour/envsubst

```sh
# basic example
cat file_includes_env_vars.txt | docker run -i --rm abdennour/envsubst
# or 
docker run -i --rm abdennour/envsubst < file_includes_env_vars.txt

# assume "Hello $NAME. My home is ${HOME}" is the content of "file.txt"
docker run -i --rm -e NAME=Abdou abdennour/envsubst < file.txt
# the above command outputs :
# "Hello Abdou. My home is /root"
```
## abdennour/jenkins

## abdennour/node

## abdennour/remark



# CI/CD 

Managed By [Docker hub automated builds](https://docs.docker.com/docker-hub/builds/)

#  Tests

**Linting** : in `docker-images/<IMAGE>/hooks/pre_build`
**Contatainer Structure Tests** in `docker-images/<IMAGE>/hooks/build`