
## naofunbciaonr

FROM ubuntu:latest

# Manter o sistema atualizado
RUN apt-get update && apt-get upgrade -y

# Instalar Postfix e Dovecot
RUN apt-get install -y postfix dovecot-core dovecot-imapd dovecot-pop3d dovecot-sieve dovecot-mysql dovecot-ldap

# Verificar se o Postfix está instalado
RUN dpkg -l | grep postfix

# Definir o fuso horário (opcional)
ENV TZ=America/Recife
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Configurar o nome do domínio
RUN echo 'jfabio.asa.br' > /etc/mailname

# Expor as portas do Postfix e Dovecot
EXPOSE 25 143 110 993 587 994

# Comando para manter o contêiner rodando com Postfix e Dovecot no primeiro plano
CMD service postfix start && dovecot -F