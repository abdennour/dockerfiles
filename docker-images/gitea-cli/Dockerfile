ARG ALPINE_VERSION
FROM abdennour/curl as downloader
WORKDIR /downloads
RUN curl -o tea \
  -L https://gitea.com/attachments/395b73a9-a56b-4933-8c99-dc2d2619925a && \
  chmod a+x tea

FROM alpine:${ALPINE_VERSION} as gitea-cli
COPY --from=downloader /downloads/tea /usr/local/bin/tea
ENTRYPOINT [ "tea" ]
CMD [ "--help" ]
