# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kaye <kaye@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/20 13:32:05 by kaye              #+#    #+#              #
#    Updated: 2021/05/09 14:12:02 by kaye             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# init
openrc
touch /run/openrc/softlevel

# run php server
php -S 0.0.0.0:5000 -t /var/www/phpmyadmin/phpmyadmin

# to keep the Container running
# tail -f /dev/null
# sleep infinite