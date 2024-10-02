FROM ubuntu:noble
LABEL maintainer="Chris Wieringa <chris@wieringafamily.com>"

# Based off of: https://gist.github.com/pi0/a7f734a69d34cc3cb2d67ec862cfa3ac

# Set versions and platforms
ARG BUILDDATE=20241002-1
ARG TZ=America/Detroit

# Do all run commands with bash
SHELL ["/bin/bash", "-c"] 

##################################
## Start with base Ubuntu
##################################

# Start with some base packages and APT setup
RUN apt update -y && \
    DEBIAN_FRONTEND=noninteractive apt install -y \
    ca-certificates \
    curl \
    gnupg \
    gpg \
    htop \
    iputils-arping \
    iputils-ping \
    iputils-tracepath \
    iproute2 \
    locales \
    netcat-openbsd \
    nmap \
    openssh-client \
    openssh-server \
    tar \
    tmux \
    unzip \
    vim \
    wget \
    zip \
    && rm -rf /var/lib/apt/lists/*

##################################
## openssh configuration
##################################

RUN cat /etc/ssh/sshd_config | grep -v "^#" | grep -v "^$" > /sshd_config && \
    echo "PermitRootLogin yes" >> /sshd_config && \
    echo "" > /etc/motd && \
    rm -rf /etc/ssh /root && \
    mkdir -p /run/sshd && \
    ln -s /data/ssh /etc/ssh && \
    ln -s /data/root /root && \
    ln -s /data/log /var/log

##################################
## Container configuration
##################################

# Set timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo "$TZ" > /etc/timezone

# Locale and Environment configuration
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV TERM xterm-256color
ENV TZ=${TZ}

##################################
## Final Container settings
##################################
ENTRYPOINT /entry.sh
VOLUME /data

COPY inc/entry.sh /
