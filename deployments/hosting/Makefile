COMPOSE_CMD=docker compose
COMPOSE_FILE=docker-compose.yaml

.PHONY: delete
delete: ${COMPOSE_FILE}
	${COMPOSE_CMD} -f ${COMPOSE_FILE} down

.PHONY: create
create: ${COMPOSE_FILE}
	${COMPOSE_CMD} -f ${COMPOSE_FILE} up -d

