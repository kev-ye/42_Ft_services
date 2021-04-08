# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kaye <kaye@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/05 09:58:40 by kaye              #+#    #+#              #
#    Updated: 2021/04/08 19:14:27 by kaye             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

## COLOR

# BLACK "\033[0;30m"
# RED "\033[0;31m"
# GREEN "\033[0;32m"
# YELLOW "\033[0;33m"
# BLUE "\033[0;34m"
# PURPLE "\033[0;35m"
# CYAN "\033[0;36m"

echo " \033[2J\033[H\033[1;36m\
 _____ _                           _
|  ___| |_     ___  ___ _ ____   _(_) ___ ___  ___
| |_  | __|   / __|/ _ \ '__\ \ / / |/ __/ _ \/ __|
|  _| | |_    \__ \  __/ |   \ V /| | (_|  __/\__ \\
|_|    \__|___|___/\___|_|    \_/ |_|\___\___||___/
         |_____|
\033[0m"

if [ $(uname) = "Linux" ] ; then
	echo "\033[0;31mIf you are in the VM, please check if you are running with 2 cores\033[0m"
	echo /etc/group | grep "docker" | grep $(whoami) | 2>/dev/null 1>&2
	if [ $? = 0 ] ; then
		# run docker without sudo
		echo "\033[0;31mPlease do\033[0m \033[0;33m\"sudo usermod -aG docker $(whoami);\"\033[0m and \033[0;31mrerun\033[0m the script"
	fi
	exit
fi

if [ $(uname) = "Linux" ] ; then
	echo "ok\n"
else
	echo "ko\n"
fi