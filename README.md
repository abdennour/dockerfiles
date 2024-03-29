# Availables Image Groups

- [abdennour/ansible](https://hub.docker.com/r/abdennour/ansible)

    * |_ **abdennour/ansible:x.y.z** (Full for DEV and CI)
    * |_ **abdennour/ansible:x.y.z-slim** (Light)

- [abdennour/aws](https://hub.docker.com/r/abdennour/aws)

    * |_ **abdennour/aws:x.y.z**

- [abdennour/docker](https://hub.docker.com/r/abdennour/docker)

    * |_ **abdennour/docker:x.y-dind**
    * |_ **abdennour/docker:x.y-dind-awsx.y.z**
    * |_ **abdennour/docker:x.y-dind-composex.y.z**
    * |_ **abdennour/docker:x.y-dind-composex.y.z-awsx.y.z**

- [abdennour/dotenv-to-js-object](https://hub.docker.com/r/abdennour/dotenv-to-js-object)

    * |_ **abdennour/dotenv-to-js-object**

dotenv-to-js-object
- [abdennour/eksctl](https://hub.docker.com/r/abdennour/eksctl)

    * |_ **abdennour/eksctl:x.y.z-aws-x.y.z**
    * |_ **abdennour/eksctl:x.y.z-aws-x.y.z-kubectl-x.y.z**    

- [abdennour/envsubst](https://hub.docker.com/r/abdennour/envsubst)

- [abdennour/git](https://hub.docker.com/r/abdennour/git)

    * |_ **abdennour/git:x.y.z**  

- [abdennour/gitea-cli](https://hub.docker.com/r/abdennour/gitea-cli)

    * |_ **abdennour/gitea-cli:x.y.z-alpine** 


- [abdennour/grails](https://hub.docker.com/r/abdennour/grails)

    * |_ **abdennour/grails:x.y.z**    

- [abdennour/golang-vscode](https://hub.docker.com/r/abdennour/golang-vscode)

    * |_ **abdennour/golang-vscode:x.y.z-dind-x.y.z-alpine-x.y**    

- [abdennour/helmfile](https://hub.docker.com/r/abdennour/helmfile)

    * |_ **abdennour/helmfile:vx.y.z-aws-x.y.z**

- [abdennour/helm](https://hub.docker.com/r/abdennour/helm)

    * |_ **abdennour/helm:x.y.z**  
    * |_ **abdennour/helm:x.y.z-awsx.y.z-kubectlvx.y.z**


- [abdennour/jq](https://hub.docker.com/r/abdennour/jq)

    * |_ **abdennour/jq:alpine-3.12**

- [abdennour/kind-cli](https://hub.docker.com/r/abdennour/kind-cli)

    * |_ **abdennour/kind-cli:vx.y.z**

- [abdennour/kubectl](https://hub.docker.com/r/abdennour/kubectl)

    * |_ **abdennour/kubectl:vx.y.z**
    * |_ **abdennour/kubectl:vx.y.z-awsx.y.z**
    * |_ **abdennour/kubectl:vx.y.z-awsx.y.z-helm-x.y.z**

- [abdennour/nexus3-cli](https://hub.docker.com/r/abdennour/nexus3-cli)

    * |_ **abdennour/nexus3-cli:vx.y.z**

- [abdennour/rhel](https://hub.docker.com/r/abdennour/rhel)

    * |_ **abdennour/rhel:x**
    * |_ **abdennour/rhel:8-ssh**

- [abdennour/terraform](https://hub.docker.com/r/abdennour/terraform)

    * |_ **abdennour/terraform:x.y.z-helmx.y.z**
    * |_ **abdennour/terraform:x.y.z-aws-iam-authenticator**
    * |_ **abdennour/terraform:x.y.z-helmx.y.z-aws-iam-auth**

- [abdennour/ubuntu-desktop](https://hub.docker.com/r/abdennour/ubuntu-desktop)

    * |_ **abdennour/ubuntu-desktop:x.y.z-devtools-<commid-id>**


# Examples

## [abdennour/ansible](https://hub.docker.com/r/abdennour/ansible)

**abdennour/ansible:x.y.z** (Full for DEV and CI)

```sh
export $(curl -SsL https://raw.githubusercontent.com/abdennour/dockerfiles/master/.env | xargs);

# basic example
docker run -it --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$(pwd):/playbook" \
  -w /playbook 
  -e DOCKER_GID_ON_HOST=$(cat /etc/group | grep docker: | cut -d: -f3) \
  -e SSH_PRIVATE_KEY_B64=$(cat ~/.ssh/id_rsa | base64) \

  abdennour/ansible:${ANSIBLE_VERSION} bash;
### Then interactively
ansible --version
## SSH client is available
cat ~/.ssh/id_rsa.pub # autogenerated if you don't pass the ENV VAR SSH_PRIVATE_KEY_B64
ssh x.y.z.y;

## Docker in Docker is available also
ansible mycontainerIdOrName -m ping -e "ansible_connection=docker"
## Molecule is also available
molecule test
## Ansible Lint is also available
ansible-lint *.yml

```

**abdennour/ansible:x.y.z-slim** (Light)

```sh
## A light ansible container
export $(curl -SsL https://raw.githubusercontent.com/abdennour/dockerfiles/master/.env | xargs);

docker run -it --rm \
  abdennour/ansible:${ANSIBLE_VERSION}-slim \
  ansible --version

```


## [abdennour/aws](https://hub.docker.com/r/abdennour/aws)

**abdennour/aws:x.y.z**

```sh
export $(curl -SsL https://raw.githubusercontent.com/abdennour/dockerfiles/master/.env | xargs);

# basic example
docker run --rm \
  -v "${HOME}/.aws:/root/.aws" \
  abdennour/aws:${AWS_CLI_VERSION} s3 ls

```

## [abdennour/docker](https://hub.docker.com/r/abdennour/docker)

**abdennour/docker:x.y-dind**

```sh
export $(curl -SsL https://raw.githubusercontent.com/abdennour/dockerfiles/master/.env | xargs);

# basic example
docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  abdennour/docker:${DOCKER_VERSION}-dind docker images

```

**abdennour/docker:x.y-dind-awsx.y.z**

```sh
export $(curl -SsL https://raw.githubusercontent.com/abdennour/dockerfiles/master/.env | xargs);

# docker + aws
docker run --name docker-aws --rm -d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "${HOME}/.aws:/root/.aws" \
  abdennour/docker:${DOCKER_VERSION}-aws${AWS_CLI_VERSION} tail -f /dev/null
## then interactively
docker exec docker-aws sh -c '$(aws ecr get-login --no-include-email --region us-west-1)';
docker exec docker-aws docker pull xxxxxxxx.dkr.ecr.us-west-1.amazonaws.com

```

## [abdennour/dotenv-to-js-object](https://hub.docker.com/r/abdennour/dotenv-to-js-object)

**abdennour/dotenv-to-js-object**

- It's a whole software.
- Check its [README.md](docker-images/dotenv-to-js-object/README.md) there.


## [abdennour/eksctl](https://hub.docker.com/r/abdennour/eksctl)

**abdennour/eksctl:x.y.z-aws-x.y.z**

```sh
export $(curl -SsL https://raw.githubusercontent.com/abdennour/dockerfiles/master/.env | xargs);

# basic example
docker run --rm \
  -v "${HOME}/.aws:/root/.aws" \
  -e AWS_PROFILE=my-aws-profile \  
  abdennour/eksctl:${EKSCTL_VERSION}-aws-${AWS_CLI_VERSION} create cluster ...
```

 **abdennour/eksctl:x.y.z-aws-x.y.z-kubectl-x.y.z** 

```sh
export $(curl -SsL https://raw.githubusercontent.com/abdennour/dockerfiles/master/.env | xargs);

# basic example
docker run --rm \
  -v "${HOME}/.aws:/root/.aws" \
  -v "${HOME}/.kube:/kube" \
  -e KUBECONFIG=/kube/config \
  -e AWS_PROFILE=my-aws-profile \  
  abdennour/eksctl:${EKSCTL_VERSION}-aws-${AWS_CLI_VERSION} \
     get nodes
```



## [abdennour/envsubst](https://hub.docker.com/r/abdennour/envsubst)

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

## [abdennour/git](https://hub.docker.com/r/abdennour/git)

**abdennour/git:x.y.z**

```sh
export $(curl -SsL https://raw.githubusercontent.com/abdennour/dockerfiles/master/.env | xargs);
alias git='docker run -it -v $(pwd):/code -w /code abdennour/git:${GIT_VERSION}'

git --version
git remote -v
git log
# so on
```

## [abdennour/gitea-cli](https://hub.docker.com/r/abdennour/gitea-cli)

**abdennour/gitea-cli:x.y.z-alpine** 

```sh
docker run -it --rm \
  -e GITEA_SERVER_URL=http://gitea:3000 \
  -e GITEA_SERVER_USER=gitea_admin \
  -e GITEA_SERVER_PASSWORD=**** \
  abdennour/gitea-cli:0.9.0-alpine \
    organizations list
```

## [abdennour/grails](https://hub.docker.com/r/abdennour/grails)

**abdennour/grails:x.y.z**

```sh
export $(curl -SsL https://raw.githubusercontent.com/abdennour/dockerfiles/master/.env | xargs);
# assuming current directory is a grails project
docker run -it \
  -v $(pwd):/app \
  -p 8080:8080 \
  abdennour/grails:${GRAILS_VERSION} run-app
# so on
```


## [abdennour/golang-vscode](https://hub.docker.com/r/abdennour/golang-vscode)

**abdennour/golang-vscode:x.y.z-dind-x.y.z-alpine-x.y**

- THIS IS ARCHIVED
  Please check https://github.com/qdm12/godevcontainer
      

## [abdennour/jenkins](https://hub.docker.com/r/abdennour/jenkins)
TODO


## [abdennour/helmfile](https://hub.docker.com/r/abdennour/helmfile)

**abdennour/helmfile:vx.y.z-aws-x.y.z**

## [abdennour/helm](https://hub.docker.com/r/abdennour/helm)

**abdennour/helm:x.y.z**
```sh
function helm
{
  # setup
  export $(curl -SsL https://raw.githubusercontent.com/abdennour/dockerfiles/master/.env | xargs);

  docker run --rm \
    -e HELM_REPO_tn=https://charts.kubernetes.tn \
    -e HELM_REPO_stable=https://kubernetes-charts.storage.googleapis.com/ \
    -v $(pwd):/code \
    -w /code \
    abdennour/helm:${HELM_VERSION} $@
}

helm repo update  
helm  template r1 stable/chart1

# example with kubeconfig

docker run .. \
 -v ${HOME}/.kube:/root/.kube:ro \
# -e KUBECONFIG=/root/.kube/config \
 abdennour/helm:${HELM_VERSION} install r2 tn/chart1


```
**abdennour/helm:x.y.z-awsx.y.z-kubectlvx.y.z**

Same doc as the other one, but you can bind also :
- volume: `${HOME}/.awss:/root/.aws:ro`
- env var: `AWS_RPOFILE`, `AWS_*s`s ,...

Indeed, this image contains also `aws` and `kubectl` CLIs.
```sh
export $(curl -SsL https://raw.githubusercontent.com/abdennour/dockerfiles/master/.env | xargs)

docker run -it --rm \
   -e HELM_REPO_stable=https://kubernetes-charts.storage.googleapis.com/ \
    -v helm-config:/root/.config/helm \
    -v helm-cache:/root/.cache/helm \
   -v ~/.kube:/kube \
  -e KUBECONFIG: /kube/config \
abdennour/helm:${HELM_VERSION}-aws${AWS_CLI_VERSION}-kubectl${KUBECTL_VERSION}
```

## [abdennour/kubectl](https://hub.docker.com/r/abdennour/kubectl)

**abdennour/kubectl:vx.y.z**

```sh
export $(curl -SsL https://raw.githubusercontent.com/abdennour/dockerfiles/master/.env | xargs);

# basic example
docker run --rm \
  -v "${HOME}/.kube:/kube" \
  -e KUBECONFIG=/kube/config \
abdennour/kubectl:${KUBECTL_VERSION} get pods

```

## [abdennour/jq](https://hub.docker.com/r/abdennour/jq)

**abdennour/jq:alpine-3.12**

```sh
```sh
export $(curl -SsL https://raw.githubusercontent.com/abdennour/dockerfiles/master/.env | xargs);

echo "{\"name\": \"abdennour\"}" > /tmp/file.json

docker run --rm -it -w /data \
  -v /tmp:/data abdennour/jq:alpine-${ALPINE_VERSION} \
  -r '.name' /data/file.json

# it must show "abdennour" in stdout

```

## [abdennour/kind-cli](https://hub.docker.com/r/abdennour/kind-cli)

**abdennour/kind-cli:vx.y.z**

```sh
export $(curl -SsL https://raw.githubusercontent.com/abdennour/dockerfiles/master/.env | xargs);

# basic example
alias kind='docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "${HOME}/.kube:/kube" \
abdennour/kind-cli:${KIND_CLI_VERSION}'

cat <<EOF | kind create cluster --config -                   
kind: Cluster
apiVersion: kind.sigs.k8s.io/v1alpha3
nodes:
- role: control-plane
- role: worker
- role: worker
EOF

export KUBECONFIG="$(kind get kubeconfig-path --name="kind")"

```

**abdennour/kubectl:vx.y.z-awsx.y.z**

```sh
export $(curl -SsL https://raw.githubusercontent.com/abdennour/dockerfiles/master/.env | xargs);

# kubectl + aws-iam-authenticator for EKS
docker run --rm \
  -v "${HOME}/.aws:/root/.aws" \
  -e AWS_PROFILE=my-aws-profile \
  -e AWS_DEFAULT_REGION=md-west-1 \
  -e CLUSTER_NAME=mycluster \
abdennour/kubectl:${KUBECTL_VERSION}-aws${AWS_CLI_VERSION} get pods
```

## [abdennour/nexus3-cli](https://hub.docker.com/r/abdennour/nexus3-cli)

This is an image for https://pypi.org/project/nexus3-cli/

**abdennour/nexus3-cli:vx.y.z**

```sh
export $(curl -SsL https://raw.githubusercontent.com/abdennour/dockerfiles/master/.env | xargs);
alias nexus3=' docker run --rm -t -v nexus3-cli:/root  abdennour/nexus3-cli:v${NEXUS3CLI_VERSION}'
# login
 nexus3  login
# Nexus OSS URL (http://localhost:8081):
# Nexus admin username (admin):
# Nexus admin password (admin123):
# Verify server certificate (True):

# Configuration saved to /root/.nexus-cli

#----
```

More about available commands: https://pypi.org/project/nexus3-cli/


## [abdennour/node](https://hub.docker.com/r/abdennour/node)
TODO

## [abdennour/remark](https://hub.docker.com/r/abdennour/remark)
TODO

## [abdennour/rhel](https://hub.docker.com/r/abdennour/rhel)

Ready to be used as Ansible Managed Host.

**abdennour/rhel:x**
```sh
docker run -it --rm \
  --name rhel8 \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  -p 6666:80
  --privileged \
  abdennour/rhel:8

# then
docker exec -it rhel8 yum install nginx -y
docker exec -it rhel8 systemctl start nginx

# In the host navigate to : http://localhost:6666
```

**abdennour/rhel:x-ssh**
- RHEL + SSHD is up

```sh
docker run --rm --name rhel-vm  \
  -p 2525:22 \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  --privileged \
  -d abdennour/rhel:8-ssh

# create user "myuser"
docker exec -it rhel-vm useradd myuser
# set password for the user
docker exec -it rhel-vm sh -c 'echo "Pass1234"| passwd myuser --stdin'
# Now SSH to container without exec:
ssh myuser@localhost -p 2525
##> Put Password: Pass1234
🎊🎊🎊 You ssh ! DONE
```
- RHEL + SSHD is up + Bootstrap Passwordless sudoer user

```sh
docker run --rm --name rhel-vm  \
  -p 2525:22 \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  -v $(pwd)/keys:/data/ssh-key:rw \
  --privileged \
  -e BOOTSTRAP_USER=myuser \
  -e BOOTSTRAP_USER_CAPS=sudoer,ssh-key \
  -d abdennour/rhel:8-ssh

# now try to ssh with the bootstrap user
#     using the auto-generated private-key
ssh -i $(pwd)/keys/myuser myuser@localhost -p 2525
# it should work
# myuser@<container-id>: $ ....

```


## [abdennour/terraform](https://hub.docker.com/r/abdennour/terraform)

**abdennour/terraform:x.y.z-helmx.y.z**

- if you are using Terraform Helm provider, this docker container image for you:

```sh
function terraform
{
  # get latest versions from .env
  export $(curl -SsL https://raw.githubusercontent.com/abdennour/dockerfiles/master/.env | xargs);

  docker run --rm \
    -e HELM_REPO_tn=https://charts.kubernetes.tn \
    -e HELM_REPO_stable=https://kubernetes-charts.storage.googleapis.com/ \
    -v $(pwd):/code \
    -w /code \
    abdennour/terraform:${TERRAFORM_VERSION}-helm${HELM_VERSION} $@
}
# 
terraform apply
```
**abdennour/terraform:x.y.z-aws-iam-authenticator**
- terraform  image has aws-iam-authenticator binary in  the PATH without extra configuration.

**abdennour/terraform:x.y.z-helmx.y.z-aws-iam-auth**

- same like the first (**abdennour/terraform:x.y.z-helmx.y.z**) but it contains also the aws-iam-authenticator binary in  the PATH.


## [abdennour/ubuntu-desktop](https://hub.docker.com/r/abdennour/ubuntu-desktop)

**abdennour/ubuntu-desktop:x.y.z-devtools-<commid-id>**

```sh
export $(curl -SsL https://raw.githubusercontent.com/abdennour/dockerfiles/master/.env | xargs);

docker run -it --rm -name daemon -d \
  -v vol-certs:/certs \
  abdennour/docker:${DOCKER_VERSION}-dind

docker run -it --rm -d --name desktop \
  -v vol-certs:/certs \
  -e VNC_RESOLUTION=1920x1080 \
  # -e VNC_VIEW_ONLY=true \
  -e DOCKER_HOST=tcp://daemon:2376 \
  -e DOCKER_TLS_VERIFY=1 \
  -e DOCKER_TLS_CERTDIR=/certs \
  -e DOCKER_CERT_PATH=/certs/client \
  -e EXTRA_PATH=/home/user/bin \
  -e SUDO_FORCE_REMOVE=no \
  -p 9889:6901 \
  --shm-size=256m \
  abdennour/ubuntu-desktop

# Now visit http://localhost:9889
```

# Contributing

If you ask how can i upgrade these versions. Or generally, how can i contribute.
then, check [CONTRIBUTING.md](CONTRIBUTING.md)

# Authors

- Abdennour Toumi < http://kubernetes.tn | ceo@kubernetes.tn >

# LICENSE

This software is licensed under MIT license.