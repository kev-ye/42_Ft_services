# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kaye <kaye@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/05 09:58:40 by kaye              #+#    #+#              #
#    Updated: 2021/04/12 13:21:49 by kaye             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

## COLOR

# BLACK "\033[1;30m"
# RED "\033[1;31m"
# GREEN "\033[1;32m"
# YELLOW "\033[1;33m"
# BLUE "\033[1;34m"
# PURPLE "\033[1;35m"
# CYAN "\033[1;36m"

echo " \033[2J\033[H\033[1;36m\
 _____ _                           _
|  ___| |_     ___  ___ _ ____   _(_) ___ ___  ___
| |_  | __|   / __|/ _ \ '__\ \ / / |/ __/ _ \/ __|
|  _| | |_    \__ \  __/ |   \ V /| | (_|  __/\__ \\
|_|    \__|___|___/\___|_|    \_/ |_|\___\___||___/
         |_____|
\033[0m"

## CONFIG FOR LINUX

if [ $(uname) = "Linux" ] ; then
	echo "\033[1;31m\n(If you are in the VM, please check if you are running with 2 cores)\n\033[0m"
	cat /etc/group | grep "docker" | grep $(whoami) 2>/dev/null 1>&2
	# $var -eq 0 : $var == 0 -> true
	# $var -ne 0 : $var != 0 -> true
	if [ $? -ne 0 ] ; then
		# run docker without sudo
		echo "\033[1;31m❗️Please do\033[0m \033[1;33m\"sudo usermod -aG docker $(whoami); newgrp docker\"\033[0m and \033[1;31mrerun\033[0m the script"
		exit
	fi
fi

## MINIKUBE & KUBERNETES & DOCKER

if [ $(uname) = "Linux" ] ; then
	echo "\033[1;36m🐧 OS : Linux\n\033[0m"
	# make sure docker is running
	service docker restart
	# run minikube
	echo "\033[1;36m\n🛳 minikube running ...\033[0m"
	minikube start --vm-driver=docker
else
	echo "\033[1;36m🍎 Os : Macos\n\033[0m"
	# installation of brew
	if ! which brew 2>/dev/null 1>&2 ; then
		echo "\033[1;32m\n🍺 brew installing ...\033[0m"
		rm -rf $HOME/.brew && git clone --depth=1 https://github.com/Homebrew/brew $HOME/.brew && echo 'export PATH=$HOME/.brew/bin:$PATH' >> $HOME/.zshrc && source $HOME/.zshrc && brew update
	fi
	# installation of kubectl
	if ! which kubectl 2>/dev/null 1>&2 ; then
		echo "\033[1;32m\n🛳  kubectl installing ...\033[0m"
		brew install kubernetes-cli
	fi
	# installation of minikube
	if ! which minikube 2>/dev/null 1>&2 ; then
		echo "\033[1;32m\n🛳  minikube installing ...\033[0m"
		brew install minikube
	fi
	if [ -d /goinfre ] ; then
		# configuration in 42 campus
		echo "\033[1;32m\n🐳 docker running ...\033[0m"
		rm -rf /goinfre/$USER/docker
		./srcs/init_docker.sh
		echo "\033[1;32m\n↔️  link minikube folder to /goinfre/ ...\033[0m"
		rm -rf /goinfre/$USER/.minikube
		rm -rf ~/.kube
		echo "export MINIKUBE_HOME=/goinfre/$USER/" >> ~/.zshrc
		source ~/.zshrc
	else
		echo "\033[1;32m\n🐳 docker running ...\033[0m"
		open -a docker
	fi
	# run minikube
	echo "\033[1;36m\n♻️  clean old minikube if exist\033[0m"
	minikube stop 2>/dev/null 1>&2 && sleep 2
	minikube delete 2>/dev/null 1>&2 && sleep 2
	echo "\033[1;32m\n🛳  minikube running ...\033[0m"
	minikube start --vm-driver=virtualbox --memory=2g --cpus=2 || echo "\033[1;31mTry the command \"minikube delete\" if failed and relaunch the script.\033[0m"
fi

## METALLB

function install_metallb()
{
	## Preparation

	# see what changes would be made, returns nonzero returncode if different
	kubectl get configmap kube-proxy -n kube-system -o yaml | \
	sed -e "s/strictARP: false/strictARP: true/" | \
	kubectl diff -f - -n kube-system

	# actually apply the changes, returns nonzero returncode on errors only
	kubectl get configmap kube-proxy -n kube-system -o yaml | \
	sed -e "s/strictARP: false/strictARP: true/" | \
	kubectl apply -f - -n kube-system

	## Installation By Manifest

	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
	# On first install only
	kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

	kubectl apply -f srcs/yaml/metallb-configmap.yaml
}

if ! kubectl get pods -n metallb-system 2>/dev/null | grep "controller" | grep "Running" 2>/dev/null 1>&2 ; then
	# enable metallb plugin with minikube addons command
	echo "\033[1;33mEnabling & configuring metallb ...\033[0m"
	if ! minikube addons enable metallb 2>/dev/null 1>&2 ; then
		# install metallb in case of failure during activation
		echo "\033[1;33mEnabling metallb with minikube addons command \033[1;31mfailed, try with manifest ...\033[0m"
		install_metallb >/dev/null
	else
		kubectl apply -f srcs/yaml/metallb-configmap.yaml
	fi
fi

echo "\033[1;31m❗️ \nLauch the command \"minikube delete\" to clean minikube when finished ❗️\n\033[0m"
zsh