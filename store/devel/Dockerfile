# NGinx image based on debian
FROM debian-dev:0.0.1

ARG server_config
ADD ./config/devel /opt/server-config
RUN cp -rvf /opt/server-config/* /

# Update all packages
RUN apt-get update && apt-get upgrade -y

# Install Debian Tools
RUN apt-get install -y --force-yes --no-install-suggests --no-install-recommends \
  git git-core
