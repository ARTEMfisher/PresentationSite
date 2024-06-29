#!/bin/bash

IMAGE_NAME="my-flask-app"

docker build -t $IMAGE_NAME .

docker run -d -p 80:80 $IMAGE_NAME
