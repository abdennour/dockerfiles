# Contribute for Upgrading Base Images
If you want to upgrade/patch any base image, you just need to follow these 2 steps:

- Update the relevant version from [.env](.env) file
- Create pull-request

This is the origin of versions mentioned in the [.env](.env) by order:

|   Key in .env	    |   Where to conclude latest version	          |
|---	              |---	                                          |
| ALPINE_VERSION    | https://hub.docker.com/_/alpine?tab=tags |
| ANSIBLE_VERSION   | https://github.com/ansible/ansible/releases | 
| AWS_CLI_VERSION   | https://github.com/aws/aws-cli/releases | 
| BUILDX_VERSION    | https://github.com/docker/buildx/releases |
| DOCKER_COMPOSE_VERSION | https://github.com/docker/compose/releases | 
| DOCKER_VERSION    | https://github.com/moby/moby/releases | 
| EKSCTL_VERSION    | https://github.com/weaveworks/eksctl/releases | 
| GIT_VERSION       | https://pkgs.alpinelinux.org/packages?name=git&branch=edge | 
| GRAILS_VERSION    | In-House Image | 
| GRAILS_JAVA_VERSION | In House Image | 
| GO_VERSION        | https://golang.org/doc/devel/release.html | 
| HELM_VERSION      | https://github.com/helm/helm/releases | 
| HELMFILE_VERSION  | https://quay.io/repository/roboll/helmfile?tab=tags | 
| HTTPD_VERSION     | https://hub.docker.com/_/httpd?tab=tags | 
| KIND_CLI_VERSION  | https://github.com/kubernetes-sigs/kind/releases | 
| KUBECTL_VERSION   | https://github.com/kubernetes/kubectl/releases | 
| MOLECULE_VERSION  | https://github.com/ansible-community/molecule/releases | 
| NEXUS3CLI_VERSION | In-house software | 
| NGINX_VERSION     | https://hub.docker.com/_/nginx?tab=tags | 
| NODE_TAG          | https://hub.docker.com/_/node?tab=tags&page=1&name=alpine | 
| PYTHON_TAG        | http://hub.docker.com/_/python?tab=tags&page=1&name=alpine | 
| TERRAFORM_VERSION | https://github.com/hashicorp/terraform/releases | 
| UBUNTU_DESKTOP_VERSION | https://hub.docker.com/r/consol/ubuntu-xfce-vnc/tags | 
| YAMLLINT_VERSION  | https://github.com/adrienverge/yamllint/releases | 



# Contribute to extend or maintain images

**Conventions**

- Each version must be tracked in the following files:

* [.env](.env) is the single source of truth for all versions

* [dockere-compose.yaml](docker-compose.yaml) must forward versions from [.env](.env) to dockerfiles arguments thru `services.builder.build.args` yaml object.

* `Dockerfile` Depends on the case, Dockerfile under `docker-images/${IMAGE_SET}/Dockerfile` will use arguments which already filled in by the values of env vars.


**Tests**

- **Linting** : in `docker-images/<IMAGE>/hooks/pre_build`

- **Contatainer Structure Tests** in `docker-images/<IMAGE>/hooks/build`


**Build or CI/CD**

CI/CD is Managed By [Docker hub automated builds](https://docs.docker.com/docker-hub/builds/)

But if you want to run it locally, these are steps: 

- Choose which `IMAGE_SET` to run where `docker-images/${IMAGE_SET}` must be directory includes a subdirectory, named `hooks`.
- Build it 

```sh
export IMAGE_SET=terraform # for example only
export DOCKER_REPO=abdennour/${IMAGE_SET} SOURCE_COMMIT=$(git rev-parse HEAD);
cd docker-images/${IMAGE_SET}
bash hooks/build

```
