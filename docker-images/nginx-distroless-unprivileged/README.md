# Overview

Secure Nginx image `abdennour/nginx-distroless-unprivileged`

- Running on port 8080 and does not accept ports below 1024
- Running with non-root user
- Files used by process are owned by
- Distrolless image (no package manager, no shell, no...)

This image combines two images: 

- `docker.io/nginxinc/docker-nginx-unprivileged` (reuse it as base)
- `docker.io/kyos0109/nginx-distroless` (reuse it as layers after base)
- Plus other instructions


# Example 1 - Basic

```sh
docker run --rm -p 8998:8080 --name secure-web -d abdennour/nginx-distroless-unprivileged

```
Then navigate to http://localhost:8998 in your browser

Try to access the container or run shell command inside container.

```sh
docker exec -it secure-web sh
# Error . It must not work

docker exec -it secure-web ash
# No way

docker exec -it secure-web ls
# I said no way

# However you are still be able to see logs
docker logs -f secure-web
# However you cannot see it with "docker exec cat" for example
```

# Example 2 - Mount your Website as volume

```sh
docker run --rm -p 9988:8080 \
  -v ./assets:/usr/share/nginx/html:ro \
  --name example-2 -d \
  abdennour/nginx-distroless-unprivileged:1.18

# where ./assets directory is on the host with some html files
```

# Example 3 - Extend the image with web assets

```Dockerfile
# You have web assets (html, js,..) in a directory `./build`
FROM alpine:3.12 as web-assets
WORKDIR /assets
RUN echo "<h1>Hello my secure nginx<h1>" > /assets/index.html

# secure image
FROM abdennour/nginx-distroless-unprivileged as release
WORKDIR /usr/share/nginx/html
COPY --from=web-assets  --chown=1001:0 /code/build/. .
EXPOSE 8080
USER 1001

```

# Example 4 - Real Example for SPA based on ReactJs - create-react-app

**./config/default.conf** is your custom configuration for nginx

```conf
server {
  # any port above 1024 will work
  listen 9090; # take not of this port
  location / {
    root   /opt/app; # Root Dir is /opt/app - Take Node of that
    index  index.html index.htm;
    try_files $uri $uri/ /index.html; # because it's SPA
    expires -1; # depending on your standard requirements
  }
  error_page   500 502 503 504  /50x.html;
  location = /50x.html {
    root   /opt/app; # because it's SPA
  }
}

```

**Dockerfile**

```Dockerfile
# stage - build ##############
FROM node:14-alpine as build
WORKDIR /code
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build
# will generate web-assets in folder /code/build

# stage - release ############
FROM abdennour/nginx-distroless-unprivileged as release
# workdir is the same as root directive in the nginx custom config.
WORKDIR /opt/app
# copy custom nginx config from your host
COPY --chown=1001:0 ./config /etc/nginx/conf.d
# copy web assets from build stage above
COPY --from=build  --chown=1001:0 /code/build/. .
# expose is the same as listen directive in the nginx custom config.
EXPOSE 9090
# no need to set again user because the default is 1001
# However you can make it always at the end as convention
USER 1001
```


