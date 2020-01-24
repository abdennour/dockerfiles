FROM jenkins/jenkins:2.193-alpine

# 18.03.1-ce
ENV DOCKER_VERSION=18.09.2
USER root
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
  && tar xzvf docker-${DOCKERVERSION}.tgz --strip 1 \
                 -C /usr/local/bin docker/docker \
  && rm docker-${DOCKERVERSION}.tgz

RUN apk --update add sudo shadow \
  && echo "jenkins ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers \
  && rm -vfr \
		/tmp/* \
		/var/tmp/* \
		/var/lib/apt/lists/*

USER jenkins
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy    
COPY entrypoint.sh /usr/local/bin/jentrypoint



ENTRYPOINT ["sh", "/usr/local/bin/jentrypoint" ]