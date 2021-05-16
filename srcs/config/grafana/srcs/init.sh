# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kaye <kaye@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/28 21:35:24 by kaye              #+#    #+#              #
#    Updated: 2021/05/16 14:17:21 by kaye             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# init
openrc
touch /run/openrc/softlevel

# start telegraf
telegraf &

# run grafana
cd /etc/grafana/bin/ && ./grafana-server

# to keep the Container running
# tail -f /dev/null
# sleep infinite