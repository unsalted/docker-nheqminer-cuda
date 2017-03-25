help:
	@cat Makefile

THREADS=
GPU?=0
HOST=$(shell hostname)
RESTART?=always
UID:=$(shell bash -c 'echo $$RANDOM')
LOCATION?=zec-us1.dwarfpool.com
PORT?=3335
ADDRESS?=t1QLFf7cemqpxPxFHL5tmtncbzUe7W7AqX8
DOCKER_FILE=Dockerfile
DOCKER?=nvidia-docker
TAG=nheqminer
NAME?=${HOST}_${UID}


define colorecho
      @tput setaf $2
      @echo $1
      @tput sgr0
endef

ifneq ($THREADS,)
	$THREADS:="-t ${THREADS}"
endif

NHEQ_FLAGS?=-l ${LOCATION}:${PORT} -u ${ADDRESS}.${NAME} -cd ${GPU} ${THREADS}
DOCKER_FLAGS=--restart ${RESTART} -i -d -h nheqminer --name ${NAME}  unsalted/nheqminer

FLAGS?=$(NHEQ_FLAGS)

bash:
	$(DOCKER) run -it -h nheqminer unsalted/$(TAG) bash

run:
	$(DOCKER) run $(DOCKER_FLAGS) nheqminer $(NHEQ_FLAGS)

	$(call colorecho,"\n\
		Pool: ${LOCATION}\n\
		Port: ${PORT}\n\
		Address: ${ADDRESS}\n\
		User: ${NAME}\n\
	",6)
	$(call colorecho, "Showing logs... exit with ctrl+c",7)
	$(call colorecho, "Kill and delete machine with \`docker kill ${NAME} && docker rm ${NAME}\`\n",3)

	docker logs -f ${NAME}

cpu:
	DOCKER_FLAGS=--restart ${RESTART} -i -d -h nheqminer --name ${NAME}  unsalted/nheqminer:cpu

	docker run $(DOCKER_FLAGS) nheqminer $(NHEQ_FLAGS)

	$(call colorecho,"\n\
		Pool: ${LOCATION}\n\
		Port: ${PORT}\n\
		Address: ${ADDRESS}\n\
		User: ${NAME}\n\
	",6)
	$(call colorecho, "Showing logs... exit with ctrl+c",7)
	$(call colorecho, "Kill and delete machine with \`docker kill ${NAME} && docker rm ${NAME}\`\n",3)

	docker logs -f ${NAME}

nheqminer:
	$(DOCKER) run $(DOCKER_FLAGS) nheqminer ${FLAGS}

	$(call colorecho,"\n\
		Pool: ${LOCATION}\n\
		Port: ${PORT}\n\
		Address: ${ADDRESS}\n\
		User: ${NAME}\n\
	",6)
	$(call colorecho, "Showing logs... exit with ctrl+c",7)
	$(call colorecho, "Kill and delete machine with \`docker kill ${NAME} && docker rm ${NAME}\`\n",3)

	docker logs -f ${NAME}

info:
	$(DOCKER) run --rm -it -h nheqminer unsalted/$(TAG) nheqminer -ci