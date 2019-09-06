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

# Unit tests

We are using this framework for unit-testing our container images: https://github.com/GoogleContainerTools/container-structure-test