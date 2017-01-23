FROM localhost:9876/debian-dev:0.0.1

ARG mysql_root_password
ARG mysql_user_name
ARG mysql_user_password
ENV MYSQL_ROOT_PASSWORD=$mysql_root_password
ENV MYSQL_USER_NAME=$mysql_user_name_
ENV MYSQL_USER_PASSWORD=$mysql_user_password

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

  mysql -h 127.0.0.1 < /tmp/default.sql && \
  mysql -h 127.0.0.1 < /tmp/db.sql && \
  
  killall mysqld && \
  sleep 10s

CMD mysqld_safe
