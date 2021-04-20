# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    debug.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kaye <kaye@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/16 19:08:43 by kaye              #+#    #+#              #
#    Updated: 2021/04/20 12:19:32 by kaye             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if [ $# -eq 1 ] && [ $1 = 'run' ] ; then
	# docker run -it -p 5050:5050 --name wp wp
	if ! docker network ls | grep test ; then
		docker network create test
	fi
	docker run -it -p 5050:5050 --network test -e WP_PASS=wppass -e SQL_IP=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' sql` --name wp wp
elif [ $# -eq 1 ] && [ $1 = 'build' ] ; then
	docker build -t wp .
elif [ $# -eq 1 ] && [ $1 = 'clean' ] ; then
	docker container kill wp
	docker container rm wp
	docker image rm wp
fi