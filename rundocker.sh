#!/bin/bash

IMAGE_NAME="my_site_image"
CONTAINER_NAME="my_site_container"
HOST_PORT=80  # Измените на другой свободный порт, например, 3001
CONTAINER_PORT=3000

# Строим Docker-образ
docker build -t $IMAGE_NAME .

# Проверяем, существует ли контейнер с именем my_site_container и удаляем его
if [ $(docker ps -a -q -f name=$CONTAINER_NAME) ]; then
    docker rm -f $CONTAINER_NAME
fi

# Запускаем контейнер
docker run -d -p $HOST_PORT:$CONTAINER_PORT --name $CONTAINER_NAME $IMAGE_NAME
