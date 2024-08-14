sudo docker rmi bind9
sudo docker build -t bind9 .
sudo docker stop bind9
sudo docker container rm bind9
sudo docker run -d --name bind9 -p 53:53/tcp -p 53:53/udp bind9

