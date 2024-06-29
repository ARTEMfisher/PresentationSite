docker stop server
docker rm server
docker run -it -d -v $(pwd):/opt/app --restart=always -p 8081:80 --name=server $(docker build -q .)