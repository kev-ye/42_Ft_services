if [ $# -eq 1 ] && [ $1 = 'run' ] ; then
	# docker run -it -p 80:80 -p 443:443 -p 22:22 --name wp wp
	docker run -it -p 80:80 --name wp wp
elif [ $# -eq 1 ] && [ $1 = 'build' ] ; then
	docker build -t wp .
elif [ $# -eq 1 ] && [ $1 = 'clean' ] ; then
	docker container kill wp
	docker container rm wp
	docker image rm wp
fi