docker stop proxy
docker container rm proxy
docker build -t proxy -f Dockerfile.proxy .
docker network create -d bridge asa-net
docker run -dp 80:80 --net=asa-net --name proxy proxy
