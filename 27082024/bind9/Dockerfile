# Usar a imagem base do Debian ou Ubuntu
FROM ubuntu:20.04

# Manter o sistema atualizado e instalar Bind9
RUN apt-get update && \
    apt-get install -y bind9 bind9utils bind9-doc && \
    apt-get clean

RUN cp /etc/bind/named.conf /etc/bind/named.backup
RUN cp /etc/bind/named.conf.local ./named.conf.local.backup
#----------------------------ASA ATT---------------------------------#
COPY jfabio.asa.br /etc/bind 
#--------------------------------------------------------------------#
COPY named.conf.local /etc/bind/
#COPY mydict.com.br /etc/bind/mydict.com.br
# Descomente e adicione seus arquivos de configuração conforme necessário

# Expor a porta 53 (DNS) tanto em TCP quanto em UDP
EXPOSE 53/tcp 53/udp

# Configurar o ponto de entrada do contêiner para iniciar o Bind9
CMD ["named", "-g", "-c", "/etc/bind/named.conf"]
