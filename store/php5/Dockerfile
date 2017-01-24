FROM debian-dev:0.0.1

ADD ./config/php5 /opt/server-config
ADD ./data/www /var/www/html

RUN cp -rvf /opt/server-config/* /

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN apt-get install -y --force-yes --no-install-suggests --no-install-recommends \
  php5 php5-cgi php5-mysql mysql-client

RUN mkdir --parents /opt/composer/bin && cd /opt/composer/bin && \
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
  php -r "if (hash_file('SHA384', 'composer-setup.php') === '55d6ead61b29c7bdee5cccfb50076874187bd9f21f65d8991d46ec5cc90518f447387fb9f76ebae1fbbacf329e583e30') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
  php composer-setup.php && \
  php -r "unlink('composer-setup.php');" && \
  ln -s /opt/composer/bin/composer.phar /usr/local/bin/composer

RUN mkdir --parents /opt/drush-8 && cd /opt/drush-8 && \
  composer init --require=drush/drush:8.* -n && \
  composer config bin-dir /usr/local/bin && \
  composer install && \
  drush -y init

#RUN mkdir --parents /var/www && cd /var/www && \
#  drush -y dl drupal-7.53 \
#    --drupal-project-rename=html

#RUN cd /var/www/html && \
#  drush -y site-install minimal \
#    --site-name=Example \
#    --account-name=admin \
#    --account-pass=admin \
#    --db-url=mysql://jojo:jojo123@mysql55/website
