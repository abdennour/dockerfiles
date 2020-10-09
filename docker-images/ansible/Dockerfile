FROM python:3.6-alpine as ansible-slim
ARG ANSIBLE_VERSION
ENV ANSIBLE_VERSION=${ANSIBLE_VERSION}
RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/community" >> /etc/apk/repositories \
	&& apk add --update --no-cache --virtual build-dependencies linux-headers build-base python3-dev libffi-dev openssl-dev py-psutil \
	&& pip3 install --no-cache-dir --upgrade pip setuptools \
	&& pip3 install --upgrade ansible==${ANSIBLE_VERSION} \
	&& apk del build-dependencies \
    && rm -rf /var/cache/apk/* \
    && rm -r /root/.cache \
    && ansible --version

FROM ansible-slim as ansible

ARG MOLECULE_VERSION
ARG YAMLLINT_VERSION
ARG ANSIBLE_LINT_VERSION

ENV MOLECULE_VERSION=${MOLECULE_VERSION} \
    YAMLLINT_VERSION=${YAMLLINT_VERSION} \
    ANSIBLE_LINT_VERSION=${ANSIBLE_LINT_VERSION}

RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/community" >> /etc/apk/repositories \
	&& apk add --update --no-cache \
        curl \
        openssl \
        ca-certificates \
        bash \
        git \
        zip \
        docker \
        openssh-client \
        sudo \
        shadow \
        sshpass \
	&& apk add --no-cache --virtual build-dependencies linux-headers build-base python3-dev libffi-dev openssl-dev py-psutil \
	&& pip3 install --no-cache-dir --upgrade pip setuptools \
	&& pip3 install --upgrade molecule==${MOLECULE_VERSION} yamllint==${YAMLLINT_VERSION} docker \
	&& pip3 install ansible-lint==${ANSIBLE_LINT_VERSION} \
	&& apk del build-dependencies \
    && rm -rf /var/cache/apk/* \
    && rm -r /root/.cache \
    && molecule --version \
    && yamllint --version

RUN \
  adduser -S ansible && \
  echo "ansible ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers 

USER ansible
WORKDIR /home/ansible

COPY fry.sh /fry.sh
ENTRYPOINT ["bash", "/fry.sh"]