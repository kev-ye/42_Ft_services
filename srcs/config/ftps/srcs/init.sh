# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kaye <kaye@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/28 19:51:58 by kaye              #+#    #+#              #
#    Updated: 2021/04/28 21:28:52 by kaye             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# init
openrc
touch /run/openrc/softlevel

# to keep the Container running
# tail -f /dev/null
sleep infinite