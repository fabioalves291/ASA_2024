# Use a imagem base do Ubuntu
FROM ubuntu:latest

# Defina variáveis de ambiente para a instalação do MySQL
ENV MYSQL_ROOT_PASSWORD=root_password
ENV MYSQL_DATABASE=wordpress_db
ENV MYSQL_USER=wordpress
ENV MYSQL_PASSWORD=wordpress_password

# Instale pacotes necessários
RUN apt-get update && apt-get install -y \
    apache2 \
    mysql-server \
    php \
    php-mysql \
    libapache2-mod-php \
    wget \
    curl \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Baixe e instale o WordPress
RUN wget https://wordpress.org/latest.tar.gz \
    && tar -xzvf latest.tar.gz \
    && cp -R wordpress/* /var/www/html/ \
    && chown -R www-data:www-data /var/www/html/ \
    && chmod -R 755 /var/www/html/ \
    && rm -rf /var/www/html/index.html

# Configuração básica do MySQL
RUN service mysql start && \
    mysql -e "CREATE DATABASE ${MYSQL_DATABASE};" && \
    mysql -e "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';" && \
    mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'localhost';" && \
    mysql -e "FLUSH PRIVILEGES;"

# Configurar Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN a2enmod rewrite
RUN service apache2 restart

# Exponha as portas necessárias
EXPOSE 80

# Comando para iniciar o Apache e o MySQL
CMD service mysql start && apache2ctl -D FOREGROUND
