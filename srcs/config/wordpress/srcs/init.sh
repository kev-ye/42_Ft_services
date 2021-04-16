# init
openrc
touch /run/openrc/softlevel

mv /APP/srcs/wp-config.php /var/www/wordpress/wordpress

# run php
php-fpm7

# run nginx
rc-service nginx start

sh