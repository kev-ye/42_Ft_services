# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kaye <kaye@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/16 19:09:09 by kaye              #+#    #+#              #
#    Updated: 2021/05/09 16:45:43 by kaye             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# TIPS : to connect ssh : ssh (ID)@(ADDRESS IP) -p (PORT)

# init
openrc
touch /run/openrc/softlevel

# run sshd
service sshd start

# run telegraf
service telegraf restart

# run nginx
# service nginx start
nginx -g 'daemon off;'

# to keep the Container running
# tail -f /dev/null
# sleep infinite