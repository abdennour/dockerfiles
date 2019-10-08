https://www.packer.io/docs/builders/docker.html
https://github.com/moby/moby/issues/3378


# Availables Image Groups : 


## abdennour/ansible

```sh
export $(curl -SsL https://raw.githubusercontent.com/abdennour/bakery-images/master/.env | xargs);

# basic example
docker run -it --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$(pwd):/playbook" \
  -w /playbook \
  -e DOCKER_GID_ON_HOST=$(cat /etc/group | grep docker: | cut -d: -f3) \
  -e SSH_PRIVATE_KEY_B64=$(cat ~/.ssh/id_rsa | base64) \

  abdennour/ansible:${ANSIBLE_VERSION} bash;
### Then interactively
ansible --version


```

## abdennour/aws

```sh
export $(curl -SsL https://raw.githubusercontent.com/abdennour/bakery-images/master/.env | xargs);

# basic example
docker run --rm \
  -v "${HOME}/.aws:/root/.aws" \
  abdennour/aws:${AWS_CLI_VERSION} s3 ls

```

## abdennour/docker`

```sh
export $(curl -SsL https://raw.githubusercontent.com/abdennour/bakery-images/master/.env | xargs);

# basic example
docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  abdennour/docker:${DOCKER_VERSION} docker images

# docker + aws
docker run --name docker-aws --rm -d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "${HOME}/.aws:/root/.aws" \
  abdennour/docker:${DOCKER_VERSION}-aws${AWS_CLI_VERSION} tail -f /dev/null

docker exec docker-aws sh -c '$(aws ecr get-login --no-include-email --region us-west-1)';
docker exec docker-aws docker pull xxxxxxxx.dkr.ecr.us-west-1.amazonaws.com

```

## abdennour/kubectl

```sh
export $(curl -SsL https://raw.githubusercontent.com/abdennour/bakery-images/master/.env | xargs);

# basic example
docker run --rm \
  -v "${HOME}/.kube:/kube" \
  -e KUBECONFIG=/kube/config \
abdennour/kubectl:${KUBECTL_VERSION} get pods
# kubectl + aws-iam-authenticator for EKS
docker run --rm \
  -v "${HOME}/.aws:/root/.aws" \
  -e AWS_PROFILE=my-aws-profile \
  -e AWS_DEFAULT_REGION=md-west-1 \
  -e CLUSTER_NAME=mycluster \
abdennour/kubectl:${KUBECTL_VERSION}-aws${AWS_CLI_VERSION} get pods
```

## abdennour/eksctl

```sh
export $(curl -SsL https://raw.githubusercontent.com/abdennour/bakery-images/master/.env | xargs);

# basic example
docker run --rm \
  -v "${HOME}/.aws:/root/.aws" \
  -e AWS_PROFILE=my-aws-profile \  
  abdennour/eksctl:${EKSCTL_VERSION} create cluster ...
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
