AGO GOLANG_VERSION
FROM golang:$GOLANG_VERSION-alpine
RUN apk update && apk add curl \
                          git \
                          protobuf \
                          bash \
                          make \
                          openssh-client && \
     rm -rf /var/cache/apk/*
 
