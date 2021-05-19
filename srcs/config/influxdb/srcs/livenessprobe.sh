# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    livenessprobe.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kaye <kaye@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/09 14:42:02 by kaye              #+#    #+#              #
#    Updated: 2021/05/12 19:18:41 by kaye             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if ! service influxdb status | grep "started" ; then
	service influxdb restart
fi

if ! pidof telegraf ; then
	telegraf &
fi