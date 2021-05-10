# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kaye <kaye@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/28 21:35:24 by kaye              #+#    #+#              #
#    Updated: 2021/05/10 14:38:02 by kaye             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# init
openrc
touch /run/openrc/softlevel

# run telegraf
service telegraf restart

# run grafana
grafana-server --homepath=/usr/share/grafana

# to keep the Container running
# tail -f /dev/null
# sleep infinite