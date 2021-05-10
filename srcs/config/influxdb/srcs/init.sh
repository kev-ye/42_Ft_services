# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kaye <kaye@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/28 21:35:30 by kaye              #+#    #+#              #
#    Updated: 2021/05/10 14:39:54 by kaye             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# init
openrc
touch /run/openrc/softlevel

# run influxdb
service influxdb start

# create telegraf database
echo "create database ftps" | influx
echo "create database grafana" | influx
echo "create database influxdb" | influx
echo "create database mysql" | influx
echo "create database nginx" | influx
echo "create database phpmyadmin" | influx
echo "create database wordpress" | influx

# run telegraf
service telegraf restart

# to keep the Container running
# tail -f /dev/null
sleep infinite