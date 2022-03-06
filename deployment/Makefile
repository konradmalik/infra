COMPOSE_CMD=docker compose

delete-rpi4-1: docker-compose.rpi4-1.yaml
	${COMPOSE_CMD} -f docker-compose.rpi4-1.yaml down

create-rpi4-1: docker-compose.rpi4-1.yaml
	${COMPOSE_CMD} -f docker-compose.rpi4-1.yaml up -d

