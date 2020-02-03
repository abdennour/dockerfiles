## Custom Dockerfile
FROM consol/ubuntu-xfce-vnc:${UBUNTU_DESKTOP_VERSION} as ubuntu-desktop-kubectl-docker
# Switch to root user to install additional software
USER 0
## Install git
RUN apt-get update -y && apt-get install -y curl git

ARG KUBECTL_VERSION
ENV KUBECTL_VERSION=${KUBECTL_VERSION}
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl

## switch back to default user
USER 1000
