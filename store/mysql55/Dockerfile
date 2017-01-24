FROM debian-dev:0.0.1

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER_NAME
ARG MYSQL_USER_PASSWORD
ARG MYSQL_USER_DATABASE

ADD ./config/mysql55 /opt/server-config
RUN cp -rvf /opt/server-config/* /

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install \
  -y --force-yes \
  --no-install-suggests --no-install-recommends \
    mysql-client-5.5 \
    mysql-server-5.5

RUN mysqld_safe & \
  sleep 10s && \

  # populating newly created server
  mysql_query="mysql -h 127.0.0.1" && \

  echo "CREATE USER '$MYSQL_USER_NAME'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';" | $mysql_query && \
  echo "CREATE DATABASE $MYSQL_USER_DATABASE CHARACTER SET utf8 COLLATE utf8_general_ci;" | $mysql_query && \
  echo "SELECT User, Host FROM mysql.user" | $mysql_query && \

  # Setting root password
  echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD'); FLUSH PRIVILEGES;" | mysql -h 127.0.0.1 && \
  
  killall mysqld && \
  sleep 10s

CMD mysqld_safe
