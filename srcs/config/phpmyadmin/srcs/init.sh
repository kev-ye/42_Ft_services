# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kaye <kaye@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/20 13:32:05 by kaye              #+#    #+#              #
#    Updated: 2021/04/23 19:27:41 by kaye             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# init
openrc
touch /run/openrc/softlevel

# add phpmyadmin config file
cp /APP/srcs/config.inc.php /var/www/phpmyadmin/phpmyadmin/config.inc.php

# give mysql ip
sed -i "s/MYSQL_IP/$SQL_IP/g" /var/www/phpmyadmin/phpmyadmin/config.inc.php

# run php server
php -S 0.0.0.0:5000 -t /var/www/phpmyadmin/phpmyadmin

# to keep the Container running
# tail -f /dev/null

# debug
# sh