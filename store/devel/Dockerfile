# NGinx image based on debian
FROM debian-dev:0.0.1

ARG server_config
ADD ./config/devel /opt/server-config
RUN cp -rvf /opt/server-config/* /

# Install Debian Tools
RUN apt-get update && apt-get install \
  git git-core \
  php5 php5-cgi php5-mysql \
  mysql-client

RUN mkdir --parents /opt/composer/bin && cd /opt/composer/bin && \
  echo "[x] Getting installer signature" && \
  INSTALLER_SIG=$(wget https://composer.github.io/installer.sig --no-check-certificate -qO -) && \
  echo "[x] Downloading installer" && \
  wget https://getcomposer.org/installer --no-check-certificate -qO composer-setup.php && \
  echo "[x] Done: $(ls -l composer-setup.php)" && \

  echo "[x] Installing composer with signature: $INSTALLER_SIG" && \
  php -r "if (hash_file('SHA384', 'composer-setup.php') === '$INSTALLER_SIG') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
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