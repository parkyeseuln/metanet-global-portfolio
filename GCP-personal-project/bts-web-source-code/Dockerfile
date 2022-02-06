FROM wordpress:php7.4-apache
WORKDIR /var/www/html/
COPY . /var/www/html/

RUN apt update && apt upgrade -y
RUN apt install vim systemctl sudo -y
RUN apt install redis -y
RUN rm /etc/apt/preferences.d/no-debian-php

EXPOSE 80


