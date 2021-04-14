if [ $# -eq 1 ] && [ $1 = 'run' ] ; then
	docker run -it -p 80:80 -p 443:443 -p 22:22 --name nginx nginx
elif [ $# -eq 1 ] && [ $1 = 'build' ] ; then
	docker build -t nginx .
elif [ $# -eq 1 ] && [ $1 = 'clean' ] ; then
	docker container rm nginx
	docker image rm nginx
fi