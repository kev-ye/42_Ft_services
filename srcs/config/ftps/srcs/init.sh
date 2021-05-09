# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kaye <kaye@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/28 19:51:58 by kaye              #+#    #+#              #
#    Updated: 2021/05/09 16:46:21 by kaye             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# init
openrc
touch /run/openrc/softlevel

# run telegraf
service telegraf restart

# start vsftpd
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

# to keep the Container running
# tail -f /dev/null
# sleep infinite