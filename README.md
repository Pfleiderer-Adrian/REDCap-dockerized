<img src="logo.png" alt="HTML ERROR" style="display: inline-block; margin: 50% auto; max-width: 300px">

# Easy REDCap
## A simple Dockerized REDCap system with a automated installation.
## What is RedCap?
REDCap is a secure web application for building and managing online surveys and databases. While REDCap can be used to collect virtually any type of data in any environment, it is specifically geared to support online and offline data capture for research studies and operations.

## Why a Dockerized installation?
To create a complete REDCap System you need to install, initialize and configure many subsystems. This Dockerized installation deliveres a complete fresh REDCap instance with only a few commands. You can use this for easly testing REDCap without the callanging installation process.

## Already implemented Features
- complete Webservice initialistation
- complete Database initialisation
- SSL out of the box
- permission configuration handling

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
