#!/bin/bash
echo $MYSQL_ROOT_PASSWORD
mysqld &
sleep 10
mysqladmin --host=127.0.0.1 --user=root password "$MYSQL_ROOT_PASSWORD"
mysqladmin --host=127.0.0.1 --user=root --pasword=$MYSQL_ROOT_PASSWORD flush-priviliges
mysql --host=127.0.0.1 --user=root --password=$MYSQL_ROOT_PASSWORD --batch -e << EOM
CREATE USER '$MYSQL_USER_NAME'@'localhost' IDENTIFIED BY '$MYSQL_USER_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER_NAME'@'localhost';
FLUSH PRIVILEGES;
EOM

