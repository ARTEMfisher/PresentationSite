docker stop darknesswave
docker rm darknesswave
IMAGE_ID=$(docker build -q .)
docker run -it -d -v $(pwd):/opt/app --restart=always -p 80 --name=darknesswave $IMAGE_ID
