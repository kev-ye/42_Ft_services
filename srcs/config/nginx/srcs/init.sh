# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kaye <kaye@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/16 19:09:09 by kaye              #+#    #+#              #
#    Updated: 2021/04/28 21:32:26 by kaye             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# TIPS : to connect ssh : ssh (ID)@(ADDRESS IP) -p (PORT)

# init
openrc
touch /run/openrc/softlevel

# run nginx
service nginx start

# run sshd
service sshd start

# to keep the Container running
# tail -f /dev/null
sleep infinite