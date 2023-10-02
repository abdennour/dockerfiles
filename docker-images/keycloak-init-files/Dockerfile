ARG ALPINE_VERSION
FROM khaliq/subvars:v0.1.3 as subvars

FROM alpine:${ALPINE_VERSION} as image
COPY --from=subvars --chown=1001:0 /usr/bin/subvars /usr/bin/subvars
RUN mkdir -p /keycloak/extensions /keycloak/themes && \
  chown -R 1001:0 /keycloak && \
  chmod g+s /keycloak
ENV COLLECTED_EXTENSIONS_MOUNT=/tmp/collected-extensions \
  COLLECTED_THEMES_MOUNT=/tmp/collected-themes \
  COLLECTED_DATA_IMPORT_MOUNT=/tmp/collected-data

COPY --chmod=555 --chown=1001:0 ./entrypoint /bin/
ENTRYPOINT ["entrypoint"]
