# Docker Image for SuiteCRM 8

1. Install Docker 1.29 or later, alternatively Install Docker Desktop where available and skip to 3

2. Install Docker-Compose 20 or later

3. Clone this repo

4. Download and unzip SuiteCRM 8 into the www folder, ensuring to name the folder "suitecrm", you can download it from here: https://suitecrm.com/suitecrm-8-beta-preview/
> **TIP** \
> Click the big red button that says something to the effect of "DOWNLOAD BETA X"

4. Run docker-compose up -d
from root folder created when the repo is cloned,
and wait for images to be pulled and containers to be created

5. Apache server should already listed on port 80 (`http://localhost`)

6. To complete installation run `docker exec -it suitecrm_suitecrm_1 /bin/bash` to access the web server container. The installation can then be run using the command stored in `./helper/SuiteCRM install.txt`. This will setup SuiteCRM using recommended values for config as well as a default admin user.
>**TIP** \
>Along with the Web Server and MYSQL, you will also find phpMyAdmin running at `http://localhost:8181` \
>Username and password to access SuiteCRM 8 is `admin` | `admin`

> **REMEMBER** \
> For a non test/local environment don't forget to change the username and password of the admin user to something that only you know and can remember!






