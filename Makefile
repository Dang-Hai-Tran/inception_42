include srcs/.env
export

all: up

up: setup
	docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down

start:
	docker compose -f ./srcs/docker-compose.yml start

stop:
	docker compose -f ./srcs/docker-compose.yml stop

status:
	docker compose -f ./srcs/docker-compose.yml ps

logs:
	docker compose -f ./srcs/docker-compose.yml logs

setup:
	./configure-hosts.sh
	sudo mkdir -p ${DATA_PATH}
	sudo mkdir -p ${DATA_PATH}/mariadb-data
	sudo mkdir -p ${DATA_PATH}/wordpress-data

clean:
	sudo rm -rf ${DATA_PATH}

fclean: down clean
	docker system prune -f -a --volumes
	docker volume rm srcs_mariadb-data srcs_wordpress-data

.PHONY: all up down start stop status logs clean fclean
