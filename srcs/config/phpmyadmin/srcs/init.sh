# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kaye <kaye@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/20 13:32:05 by kaye              #+#    #+#              #
#    Updated: 2021/05/12 14:35:40 by kaye             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# init
openrc
touch /run/openrc/softlevel

# start telegraf
telegraf &

# run php server
# php -S 0.0.0.0:5000 -t /var/www/phpmyadmin/phpmyadmin

# run php
service php7-fpm start

# run nginx
# service nginx start
nginx -g 'daemon off;'

# to keep the Container running
# tail -f /dev/null
sleep infinite