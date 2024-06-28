#!/bin/bash

# Имя Docker-образа
IMAGE_NAME="my_site_image"

# Порт, который будет использован контейнером
HOST_PORT=3000
CONTAINER_PORT=3000

# Строим Docker-образ
docker build -t $IMAGE_NAME .

# Проверяем, существует ли контейнер с именем my_site_container и удаляем его
if [ $(docker ps -a -q -f name=my_site_container) ]; then
    docker rm -f my_site_container
fi

# Запускаем контейнер
docker run -d -p $HOST_PORT:$CONTAINER_PORT --name my_site_container $IMAGE_NAME
