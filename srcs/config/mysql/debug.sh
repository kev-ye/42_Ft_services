if [ $# -eq 1 ] && [ $1 = 'run' ] ; then
	docker run -it --name sql sql
elif [ $# -eq 1 ] && [ $1 = 'build' ] ; then
	docker build -t sql .
elif [ $# -eq 1 ] && [ $1 = 'clean' ] ; then
	docker container kill sql
	docker container rm sql
	docker image rm sql
fi