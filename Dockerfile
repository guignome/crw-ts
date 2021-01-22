FROM registry.access.redhat.com/ubi8/ubi
USER root
LABEL maintainer="Guillaume Radde <guillaume.radde@redhat.com>"
ENV PKGS="nodejs npm nodejs-nodemon nss_wrapper rsync"
# Update image
RUN yum update --disablerepo=* --enablerepo=ubi-8-appstream --enablerepo=ubi-8-baseos -y && rm -rf /var/cache/yum
RUN yum install --disablerepo=* --enablerepo=ubi-8-appstream --enablerepo=ubi-8-baseos ${PKGS} -y &&\
  rm -rf /var/cache/yum
# Add default Web page and expose port
RUN echo "The Web Server is Running" > /var/www/html/index.html

EXPOSE 80
# Start the service
CMD ["run", "start"]
ENTRYPOINT ["npm"]
