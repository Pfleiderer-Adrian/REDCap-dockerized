<img src="logo2.png" alt="HTML ERROR" style="max-width: 1000px;"><br><h2>Why a Dockerized installation?</h2>To create a complete REDCap System you need to install, initialize and configure many subsystems. This Dockerized installation deliveres a complete fresh REDCap instance with only a few commands. You can use this for easly testing REDCap without the callanging installation process.
<h2>What is RedCap?</h2>
REDCap is a secure web application for building and managing online surveys and databases. While REDCap can be used to collect virtually any type of data in any environment, it is specifically geared to support online and offline data capture for research studies and operations.

## Already implemented Features
- complete Webservice installation
- complete Database installation
- permission handling
- initial REDCap configuration
- SSL out of the box

## Project structure
In the Folder **Webservice** are all components for building the Webapplication. The Web-**Dockerfile** is based on the [official php docker container](https://hub.docker.com/_/php) with a apache2 integration. The **src** Folder contains all scripts for the automated installation. Here you have to insert the offical REDCap Source files as a .zip package. For the SSL konfiguration you need the **ssl** Folder. Your own key and the associated certificate must be inserted in the subfolders.<br><br>
The Folder **MariaDB** contains all components for building the Database. The DB-**Dockerfile** is based on the [official MariaDB docker container](https://hub.docker.com/_/mariadb)<br><br>
The most important file is the .env file which contains all private variables for the REDCap system. These must be set before the start.

## Requirements
- The REDCap Source Files:
REDCap is a ClosedSource Project. To get the source files you have to request them from Redcap first.

- Docker & Docker Compose :
Docker and Docker-Compose must be installed on your system.

## Installation
The first thing to do is download or clone the repository.

Then the zipped source files from the REDCap Project have to be moved into the source folder.

For the SSL configuration, the key must be stored in the key folder and the certificate in the crt folder.
If you don't already have an SSL certificate, you can easily create one for development purposes.
On Ubuntu with openssl:
```sh
cd /path/to/Dockerized_REDCap
sudo openssl req -x509 -nodes -days 356 -newkey rsa:2048 -keyout /Dockerized_REDCap/Webservice/ssl/key/redcap.key -out /Dockerized_REDCap/Webservice/ssl/crt/redcap.crt
```

Last step is to edit the .env file and set the desiered database credentials.

Now we can build and execute our Image:
```sh
cd /path/to/Dockerized_REDCap
sudo docker-compose up -d --build
```

## Upcoming Features
- Mailing Service
