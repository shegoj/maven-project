FROM jenkins/slave:3.16-1-alpine
MAINTAINER Oleg Nenashev <o.v.nenashev@gmail.com>
LABEL Description="This is a base image, which allows connecting Jenkins agents via JNLP protocols" Vendor="Jenkins project" Version="3.16"

USER root    
RUN apk update && apk add \ 
    bash \
    docker \
    go \
    wget \
    git \
    terraform \
    ansible \
    curl \
    zip \
    unzip \
    wget \
    curl \
    python \
    py-pip \
    py2-pip && \
    pip install --upgrade pip awscli s3cmd && \
    mkdir /root/.aws && apk --purge -v del py-pip \
    && rm -rf /var/cache/apk/*

COPY jenkins-slave /usr/local/bin/jenkins-slave

ENTRYPOINT ["jenkins-slave"]


