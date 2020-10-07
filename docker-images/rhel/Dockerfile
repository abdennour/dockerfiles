FROM registry.access.redhat.com/ubi7/ubi-init as rhel7

FROM rhel7 as rhel7-ssh
RUN yum install -y \
      sudo \
      http://mirror.centos.org/centos/7/os/x86_64/Packages/openssh-server-7.4p1-21.el7.x86_64.rpm && \
      yum clean all && \
      rm -rf /var/cache/yum
COPY fry /sbin/fry
RUN chmod a+x /sbin/fry
ENTRYPOINT [ "/sbin/fry" ]

FROM registry.access.redhat.com/ubi8/ubi-init as rhel8

RUN yum module install python36 -y && \
  ln -s /usr/bin/python3 /usr/bin/python && \
  yum clean all


FROM rhel8 as rhel8-ssh
# https://pkgs.org/
RUN yum install -y \
      sudo \
      http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/openssh-server-8.0p1-4.el8_1.x86_64.rpm
COPY fry /sbin/fry
RUN chmod a+x /sbin/fry
ENTRYPOINT [ "/sbin/fry" ]

