FROM registry.access.redhat.com/ubi8/ubi
USER root
LABEL maintainer="Guillaume Radde <guillaume.radde@redhat.com>"
ENV PKGS="nodejs npm nodejs-nodemon nss_wrapper rsync git maven java-11-openjdk-devel " \
    APP_ROOT="/opt/app-root"
# Update image
RUN yum update --disablerepo=* --enablerepo=ubi-8-appstream --enablerepo=ubi-8-baseos -y && rm -rf /var/cache/yum
RUN yum install --disablerepo=* --enablerepo=ubi-8-appstream --enablerepo=ubi-8-baseos ${PKGS} -y &&\
  rm -rf /var/cache/yum &&\
  mkdir ${APP_ROOT}
WORKDIR ${APP_ROOT}
EXPOSE 80
ENTRYPOINT ["/bin/sh"]
