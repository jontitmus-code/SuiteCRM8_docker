FROM ubuntu:latest

LABEL org.opencontainers.image.authors="jon@titmus.me"

ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt -y upgrade
RUN apt-get install vim -y
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get install apache2 -y

RUN apt -y install ca-certificates apt-transport-https software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN apt-get -y update
RUN apt-get install -y php7.4 libapache2-mod-php7.4
RUN apt-get install -y php7.4-fpm libapache2-mod-fcgid
RUN apt-get install -y php7.4-mysql
RUN apt-get install -y php7.4-curl php7.4-intl php7.4-zip php7.4-imap

RUN a2enmod rewrite
RUN a2enconf php7.4-fpm

RUN apt install -y php7.4-xml php7.4-mbstring 
RUN apt install -y zlib1g-dev libxml2-dev

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y nodejs \
    npm    

RUN npm install -g @angular/cli
RUN npm install --global yarn

CMD ["apachectl", "-D", "FOREGROUND"]

EXPOSE 80
