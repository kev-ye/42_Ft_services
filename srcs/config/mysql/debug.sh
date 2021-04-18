# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    debug.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kaye <kaye@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/16 19:09:37 by kaye              #+#    #+#              #
#    Updated: 2021/04/18 13:22:12 by kaye             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if [ $# -eq 1 ] && [ $1 = 'run' ] ; then
	# docker run -it -p 3306:3306 -e WP_PASS=wppass -e ADMIN_PASS=adminpass --name sql sql
	docker run -it -p 3306:3306 --network test -e WP_PASS=wppass -e ADMIN_PASS=adminpass --name sql sql
elif [ $# -eq 1 ] && [ $1 = 'build' ] ; then
	docker build -t sql .
elif [ $# -eq 1 ] && [ $1 = 'clean' ] ; then
	docker container kill sql
	docker container rm sql
	docker image rm sql
fi