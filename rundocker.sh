#!/bin/bash

# Определяем имя Docker образа и контейнера
IMAGE_NAME="darknesswave"
CONTAINER_NAME="darknesswave"

# Останавливаем и удаляем существующий контейнер
docker stop $CONTAINER_NAME 2>/dev/null
docker rm $CONTAINER_NAME 2>/dev/null

# Собираем Docker образ и получаем его ID
DOCKER_IMAGE_ID=$(docker build -q .)

# Запускаем Docker контейнер
docker run -it -d -v $(pwd):/opt/app --restart=always -p 8081:80 --name $CONTAINER_NAME $DOCKER_IMAGE_ID
