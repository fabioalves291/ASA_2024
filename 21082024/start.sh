docker build -t my-ubuntu-wordpress-image .
docker run --name my-ubuntu-wordpress-container -p 8000:80 -d my-ubuntu-wordpress-image

