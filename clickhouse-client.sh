#!/bin/sh

# Nome da imagem com o clickhouse-client
IMAGE="bitnami/clickhouse:latest"
CONTAINER_NAME="clickhouse-client-container"

# Server do ClickHouse na rede interna da 42 (só funciona dentro da 42 São Paulo)
CLICKHOUSE_HOST="10.51.200.204"

# Usuário e senha do ClickHouse. Verifique o arquivo users.txt para as suas informações
CLICKHOUSE_USER="bocal"
CLICKHOUSE_PASSWORD="do35r3wzJp2rEd"

# Verifica se o container já está em execução
if [ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    # Verifica se o container existe mas não está em execução
    if [ "$(docker ps -aq -f status=exited -f name=$CONTAINER_NAME)" ]; then
        # Inicia o container parado
        docker start $CONTAINER_NAME
    else
        # Cria e inicia um novo container
        docker run -d --name $CONTAINER_NAME $IMAGE tail -f /dev/null
    fi
fi

# Comando para executar o clickhouse-client com os argumentos passados
docker exec -it $CONTAINER_NAME \
    clickhouse-client --host $CLICKHOUSE_HOST --user $CLICKHOUSE_USER --password $CLICKHOUSE_PASSWORD "$@"