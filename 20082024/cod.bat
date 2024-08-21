docker rmi c01
docker rmi c02
docker rmi c03
docker rmi proxy
docker stop c01
docker stop c02
docker stop c03
docker stop proxy
docker container prune -f
docker build -t c01 -f Dockerfile.c01 .
docker build -t c02 -f Dockerfile.c02 .
docker build -t c03 -f Dockerfile.c03 .
docker build -t proxy -f Dockerfile.proxy .
docker network create -d bridge asa-net
docker run -d --net=asa-net --name c01 c01
docker run -d --net=asa-net --name c02 c02
docker run -d --net=asa-net --name c03 c03
docker run -dp 80:80 --net=asa-net --name proxy proxy
