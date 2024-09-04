docker rmi c01
docker rmi proxy
docker stop c01
docker stop proxy
docker container prune -f
#docker build -t c01 -f Dockerfile.c01 .
docker build -t proxy -f Dockerfile.proxy .
docker network create -d bridge asa-net
#docker run -d --net=asa-net --name c01 c01
docker run -dp 80:80 --net=asa-net --name proxy proxy
