https://www.packer.io/docs/builders/docker.html
https://github.com/moby/moby/issues/3378

# Prepare

- Install docker
- Install `YAML Querty "yq"`: `brew install python-yq`
- 
# Bake

```sh
docker-compose build
```

# Menu of meals:

```
docker-compose config | yq -r .services.${service}.image
```

# Available images:

**1. remark**

```yaml
version: '3.7'

services:
  presentation:
    image: abdennour/remark:0.14.0-nginx-1.17-alpine
    ports:
    - 8080:80
    volumes:
    - ./myslides.md:/usr/share/nginx/html/slides.md
```


# Unit tests

We are using this framework for unit-testing our container images: https://github.com/GoogleContainerTools/container-structure-test