# NGinx image based on debian
FROM debian-dev:0.0.1

ADD ./config/nginx /opt/server-config
RUN cp -rvf /opt/server-config/* /

ENV DEBIAN_FRONTEND=noninteractive

RUN wget http://nginx.org/keys/nginx_signing.key -qO - | apt-key add -
RUN apt-get install -y --force-yes --no-install-suggests \
  nginx
