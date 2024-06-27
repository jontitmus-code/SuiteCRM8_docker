# Docker Image for SuiteCRM 8

1. Install Docker 26.1.4 or later, alternatively Install Docker Desktop where available and skip to 3

2. Install Docker-Compose 2.27.1 or later

3. Clone this repo

4. Download and unzip SuiteCRM 8 into the www folder, ensuring to name the folder "SuiteCRM", you can download it from here: https://suitecrm.com/download/

5. Run docker-compose up -d
from root folder created when the repo is cloned,
and wait for images to be pulled and containers to be created

5. Apache server will be listening on: 
* localport 8080 linked to port 80 (`http://localhost:8080`), and 
* localport 8081 linked to port 443 (`https://localhost:8081`)
>**NOTE** (https) \
>Until you replace `./docker/config/apache/apache-selfsigned.crt` and `./docker/config/apache/apache-selfsigned.key` files with a certificate and key, and then uncomment the `VirtualHost *:443` and its children in the `./docker/config/apache/sites.conf` file, https will not point anywhere and will not work.
>You will need to restart your containers once you have made the necessary changes for them to take affect.\
>For development environments, you can generate self-signed certificates with the following commands:\
>`you@yourpc#docker exec -it suitecrm-suitecrm-1 /bin/bash`\
>`root@your_container#openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt`

6. Installation is now handled through the application itself and can be reached at `http://localhost:8080` or `https://localhost:8081` dependent on your setup.
   Variables for setup can be found below:
* URL: localhost
* SuiteCRM Database User: suitecrm [can be changed in `./docker-compose.yml`]
* SuiteCRM Database User Password: suitecrm [can be changed in `./docker-compose.yml`]
* Host Name: mysql_crm
* Database Name: suitecrm
* Database Port:3306
* SuiteCRM Application Admin Name: your name!
* SuiteCRM Admin User Password: your choice!

>**TIP** (db admin)\
>Along with the Web Server and MYSQL, you will also find phpMyAdmin running at `http://localhost:8181`

> **REMEMBER** (Production environments) \
>For a non test/local environment don't forget to change the username and password of the admin user to something that only you know and can remember!
>It is also recommended that you disable phpMyAdmin. 






