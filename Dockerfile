FROM ubuntu:22.04
#Ubuntu 22.04 supported until APR 2032 - https://ubuntu.com/about/release-cycle
#PHP 8.2 supported until 31 Dec 2026 - https://www.php.net/supported-versions.php
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
RUN apt-get install -y php8.2 libapache2-mod-php8.2
RUN apt-get install -y php8.2-fpm libapache2-mod-fcgid
RUN apt-get install -y php8.2-mysql
RUN apt-get install -y php8.2-curl php8.2-intl php8.2-zip php8.2-imap php8.2-gd 
RUN apt-get -y update
RUN apt-get install -y php8.2-soap php8.2-ldap

RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enconf php8.2-fpm

RUN apt install -y php8.2-xml php8.2-mbstring
RUN apt install -y zlib1g-dev libxml2-dev

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y nodejs \
    npm

RUN npm install -g @angular/cli
RUN npm install --global yarn

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

WORKDIR /var/www/html/
RUN chown -R www-data:www-data .
RUN chmod -R 755 .

CMD ["apachectl", "-D", "FOREGROUND"]

EXPOSE 80 443
