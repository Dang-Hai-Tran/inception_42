LOGIN		=datran
DOMAIN		=${LOGIN}.42.fr
DATA_PATH	=/home/${LOGIN}/data
ENV=		LOGIN=${LOGIN} DOMAIN=${DOMAIN} DATA_PATH=${DATA_PATH}

all:	up

up:		setup
		${ENV} docker compose -f ./srcs/docker-compose.yml up -d --build

down:
		${ENV} docker compose -f ./srcs/docker-compose.yml down

start:
		${ENV} docker compose -f ./srcs/docker-compose.yml start

stop:
		${ENV} docker compose -f ./srcs/docker-compose.yml stop

status:
		${ENV} docker compose -f ./srcs/docker-compose.yml ps

logs:
		${ENV} docker compose -f ./srcs/docker-compose.yml logs

setup:
		${ENV} ./srcs/tools/configure-hosts.sh
		sudo mkdir -p ${DATA_PATH}
		sudo mkdir -p ${DATA_PATH}/mariadb-data
		sudo mkdir -p ${DATA_PATH}/wordpress-data

clean:
		sudo rm -rf ${DATA_PATH}

fclean:
		docker system prune -f -a --volumes
		docker volume rm srcs_mariadb-data srcs_wordpress-data

.PHONY: all up down start stop status logs setup clean fclean
