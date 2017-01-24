# Debian image based on debian
FROM debian:jessie

ADD ./config/debian /opt/server-config
RUN cp -rvf /opt/server-config/* /

ENV DEBIAN_FRONTEND=noninteractive

# Update all packages
RUN apt-get update && apt-get upgrade

# Install Debian Tools
RUN apt-get install \
  wget \
  net-tools
