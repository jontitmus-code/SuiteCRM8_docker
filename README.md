# Docker Image for SuiteCRM 8

1. Install Docker 1.29 or later, alternatively Install Docker Desktop where available and skip to 3

2. Install Docker-Compose 20 or later

3. Clone this repo

4. Download and unzip SuiteCRM 8 into the www folder, ensuring to name the folder "SuiteCRM", you can download it from here: https://docs.suitecrm.com/8.x/admin/releases/8.0/#_8_0_1

4. Run docker-compose up -d
from root folder created when the repo is cloned,
and wait for images to be pulled and containers to be created

5. Apache server should already listed on port 80 (`http://localhost`)

6. To complete installation run `docker exec -it suitecrm_suitecrm_1 /bin/bash` to access the web server container. The installation can then be run using the command stored in `./helper/SuiteCRM install.txt`. This will setup SuiteCRM using recommended values for config as well as a default admin user.
>**TIP** \
>Along with the Web Server and MYSQL, you will also find phpMyAdmin running at `http://localhost:8181` \
>Username and password to access SuiteCRM 8 is `admin` | `admin`\
>The hostname of the db is `mysql_crm`. (You need this Information, if you want to configure the crm with over the webinterface)

> **REMEMBER** \
> For a non test/local environment don't forget to change the username and password of the admin user to something that only you know and can remember!






