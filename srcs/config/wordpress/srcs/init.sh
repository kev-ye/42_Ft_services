# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kaye <kaye@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/16 19:08:35 by kaye              #+#    #+#              #
#    Updated: 2021/05/12 14:35:48 by kaye             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# init
openrc
touch /run/openrc/softlevel

# configure msql password
sed -i "s/WP_PASSWORD/$WP_PASS/g" /var/www/wordpress/wordpress/wp-config.php

# start telegraf
telegraf &

# run php server
# php -S 0.0.0.0:5050 -t /var/www/wordpress/wordpress

# run php
service php7-fpm start

# run nginx
# service nginx start
nginx -g 'daemon off;'

# to keep the Container running
# tail -f /dev/null
sleep infinite