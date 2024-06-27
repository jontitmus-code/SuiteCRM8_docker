FROM amd64/ubuntu:22.04
#Supported until APR 2032 - https://ubuntu.com/about/release-cycle
LABEL org.opencontainers.image.authors="jon@titmus.me"

ENV TZ=Europe/London
ARG DEBIAN_FRONTEND=noninteractive
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt -y upgrade
RUN apt -y install software-properties-common
RUN apt -y install ca-certificates apt-transport-https

#RUN apt-get install vim -y

RUN apt-get install apache2 -y

RUN apt-get install -y language-pack-en-base
RUN LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php
RUN apt-get -y update
RUN apt-get install -y php7.4 libapache2-mod-php7.4
RUN apt-get install -y php7.4-fpm libapache2-mod-fcgid
RUN apt-get install -y php7.4-mysql
RUN apt-get install -y php7.4-curl php7.4-intl php7.4-zip php7.4-imap php7.4-gd 
RUN apt-get -y update
RUN apt-get install -y php7.4-soap php7.4-ldap

RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enconf php7.4-fpm

RUN apt install -y php7.4-xml php7.4-mbstring
RUN apt install -y zlib1g-dev libxml2-dev

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y nodejs \
    npm

RUN npm install -g @angular/cli
RUN npm install --global yarn

#RUN find . -exec chown www-data:www-data {} \;

CMD ["apachectl", "-D", "FOREGROUND"]

EXPOSE 80 443
