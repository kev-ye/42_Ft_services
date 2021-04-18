# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kaye <kaye@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/16 19:08:35 by kaye              #+#    #+#              #
#    Updated: 2021/04/18 13:18:36 by kaye             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# init
openrc
touch /run/openrc/softlevel

mv /APP/srcs/wp-config.php /var/www/wordpress/wordpress

# run php
php-fpm7

# run nginx
rc-service nginx start

sh