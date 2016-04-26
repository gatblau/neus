#
# CentOS 7 with ssh and sudo
# builds a docker image that has systemd (on base image), ssh and sudo
# Use for emulating Virtual machines running CentOS 7 or RHEL 7 for testing playbooks.
#
FROM centos:7
MAINTAINER "gatblau" <admin@gatblau.org>
ENV container docker
RUN yum install -y openssh-server; \
    yum install -y sudo
VOLUME [ "/sys/fs/cgroup" ]
CMD [ "/usr/sbin/init" ]
