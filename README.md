# Branch: Master
This branch now fully initialises by itself on initial start unless the `VERSION` file exists in the `/SuiteCRM` directory.
This includes auto creation of self-signed certs.

This branch is recommended for first time users or someone looking to test SuiteCRM.
For a more traditional Compose image, I would recommend looking at the `clean` branch of this repo.

# Docker Image for SuiteCRM 8

1. Install Docker 26.1.4 or later, alternatively Install Docker Desktop where available and skip to 3

2. Install Docker-Compose 2.27.1 or later

3. Clone this repo

4. Run `docker-compose up -d`
from root folder created when the repo is cloned,
and wait for images to be pulled and containers to be created

5. Apache server will be listening on: 
* localport 8080 linked to port 80 (`http://localhost:8080`), and 
* localport 8081 linked to port 443 (`https://localhost:8081`)

6. Installation is now handled through the application itself and can be reached at `http://localhost:8080` or `https://localhost:8081`.
   Variables for setup can be found below:
* URL: localhost
* SuiteCRM Database User: suitecrm [can be changed in `./docker-compose.yml`]
* SuiteCRM Database User Password: suitecrm [can be changed in `./docker-compose.yml`]
* Host Name: mysql_crm
* Database Name: suitecrm
* Database Port:3306
* SuiteCRM Application Admin Name: your name!
* SuiteCRM Admin User Password: your choice!

> **Warning** (Production environments) \
> This is not intended to be used for production environments!






