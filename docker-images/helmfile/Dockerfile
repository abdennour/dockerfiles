ARG HELMFILE_VERSION
FROM quay.io/roboll/helmfile:helm3-${HELMFILE_VERSION} as helmfile-aws

ARG AWS_CLI_VERSION
ENV AWS_CLI_VERSION=${AWS_CLI_VERSION}
RUN apk add --update py-pip \
  && apk add --update -t deps curl gettext \
  && pip install --no-cache-dir awscli==$AWS_CLI_VERSION \
  && rm -rf /var/cache/apk/*

ARG AWS_IAM_AUTHENTICATOR_VERSION
ENV AWS_IAM_AUTHENTICATOR_VERSION=${AWS_IAM_AUTHENTICATOR_VERSION}
RUN curl -L https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator -o /usr/local/bin/aws-iam-authenticator \
  & wait \
  && chmod +x /usr/local/bin/aws-iam-authenticator


ENTRYPOINT [ "helmfile" ]