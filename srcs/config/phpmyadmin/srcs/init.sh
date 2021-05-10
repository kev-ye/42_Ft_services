# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kaye <kaye@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/20 13:32:05 by kaye              #+#    #+#              #
#    Updated: 2021/05/10 14:36:13 by kaye             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# init
openrc
touch /run/openrc/softlevel

# run telegraf
service telegraf restart

# run php server
php -S 0.0.0.0:5000 -t /var/www/phpmyadmin/phpmyadmin

# to keep the Container running
# tail -f /dev/null
# sleep infinite