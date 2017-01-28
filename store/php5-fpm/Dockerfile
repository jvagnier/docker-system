# PHP5-FPM image based on debian
FROM debian-dev:0.0.1

ADD ./config/php5-fpm /opt/server-config

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y --force-yes --no-install-suggests \
  php5 php5-fpm php5-mysql

RUN cp -rvf /opt/server-config/etc/php5/fpm/* /etc/php5/fpm/
