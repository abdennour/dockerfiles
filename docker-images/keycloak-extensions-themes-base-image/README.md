
```Dockerfile
FROM abdennoor/keycloak-extensions-themes-base-image as final
## exampel copying extensions
# COPY --from=build --chown=1001:0 /code/target/my-extension.jar /keycloak/extensions
### example copying themes
# COPY --chown=1001:0 ./my-themes/ /keycloak/themes/
```
==> output my-kk-base-image:v1.0


Then, with docker-compose

```yaml

services:
  init-keycloak:
    image:  my-kk-base-image:v1.0
    volumes:
      - kk-extensions:/tmp/collected-extensions
      - kk-themes: /tmp/collected-themes
    environment:
      COLLECTED_EXTENSIONS_MOUNT: /tmp/collected-extensions
      COLLECTED_THEMES_MOUNT: /tmp/collected-themes
  app:
    image: bitnami/keycloak:latest
    volumes:
      - kk-themes:/opt/bitnami/keycloak/themes:ro
      - kk-extensions:/opt/bitnami/keycloak/standalone/deployments:ro
volumes:
  kk-extensions:
  kk-themes:
```



