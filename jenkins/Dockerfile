FROM jenkins/jenkins:lts-alpine
LABEL maintainer="Harvash <harvash2004@yahoo.com>"

ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY jenkins_plugin_list.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

# Scaling
RUN /usr/local/bin/install-plugins.sh kubernetes

USER root
RUN apk add docker py-pip python-dev libffi-dev openssl-dev gcc libc-dev make ansible

RUN pip install docker-compose
USER jenkins