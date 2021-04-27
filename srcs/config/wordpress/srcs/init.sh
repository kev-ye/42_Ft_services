# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kaye <kaye@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/16 19:08:35 by kaye              #+#    #+#              #
#    Updated: 2021/04/27 13:11:57 by kaye             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# init
openrc
touch /run/openrc/softlevel

# add wp config file
mv /APP/srcs/wp-config.php /var/www/wordpress/wordpress/

# configure mysql ip
# sed -i "s/MYSQL_IP/$SQL_IP/g" /var/www/wordpress/wordpress/wp-config.php

# configure msql password
sed -i "s/WP_PASSWORD/$WP_PASS/g" /var/www/wordpress/wordpress/wp-config.php

# run php
# php-fpm7

# run nginx
# rc-service nginx start

# run php server
php -S 0.0.0.0:5050 -t /var/www/wordpress/wordpress

# to keep the Container running
# tail -f /dev/null
sleep infinite

# debug
# sh