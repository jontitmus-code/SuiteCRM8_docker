#!/bin/bash 

do_init () {
  echo "Initialising"
  echo "Downloading SuiteCRM 8.7.1"
   wget -q https://suitecrm.com/download/148/suite87/564667/suitecrm-8-7-1.zip
   echo "Extracting"
   unzip -o -q suitecrm-8-7-1.zip -d SuiteCRM/
   echo "Generating self signed keys"
   openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
          -keyout /etc/ssl/private/apache-selfsigned.key \
          -out /etc/ssl/certs/apache-selfsigned.crt \
          -subj "/C=UK/ST=TestSt/L=Test/O=OS/CN=localhost"
}

if ! [ -f SuiteCRM/VERSION ]; 
  then
    do_init
fi
  
if [stat -c "%U %G"] != "www-data www-data"
  then
    chown -R www-data:www-data .
    echo "Permissions set"
  fi

      echo "starting Apache server"
     
      echo "SuiteCRM is now available @ http://localhost:8080 and https://localhost:8081"
      echo "PHPMyAdmin is available @ http://localhost:8181"
      echo "MySQL is available on port 3306"

      apachectl -D FOREGROUND