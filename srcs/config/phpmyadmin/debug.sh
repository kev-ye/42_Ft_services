# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    debug.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kaye <kaye@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/16 19:08:43 by kaye              #+#    #+#              #
#    Updated: 2021/04/20 14:59:04 by kaye             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if [ $# -eq 1 ] && [ $1 = 'run' ] ; then
	# docker run -it -p 5050:5050 --name phpmyadmin phpmyadmin
	if ! docker network ls | grep test ; then
		docker network create test
	fi
	# docker run -it -p 5000:5000 --network test --name phpmyadmin phpmyadmin
	docker run -it -p 5000:5000 --network test -e SQL_IP=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' sql` --name phpmyadmin phpmyadmin
elif [ $# -eq 1 ] && [ $1 = 'build' ] ; then
	docker build -t phpmyadmin .
elif [ $# -eq 1 ] && [ $1 = 'clean' ] ; then
	docker container kill phpmyadmin
	docker container rm phpmyadmin
	docker image rm phpmyadmin
fi