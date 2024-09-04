docker rmi bind9
docker build -t bind9 .
docker stop bind9
docker container rm bind9
docker run -d --name bind9 -p 53:53/tcp -p 53:53/udp bind9

