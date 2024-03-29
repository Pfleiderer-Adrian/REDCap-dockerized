<img src="logo.png" alt="HTML ERROR" style="max-width: 1000px;"><br><h2>Why a dockerized installation?</h2>To create a complete REDCap System you need to install, initialize and configure many subsystems. This Dockerized installation deliveres a complete fresh REDCap instance with only a few commands. You can use this for easily testing REDCap without the challenging installation process.
> Note: This is not a offical REDCap Repository. Its a community based project. You need the offical REDCap permissions and source files to run REDCap. This repository contains no source files from REDCap.

## What is REDCap?
REDCap is a secure web application for building and managing online surveys and databases. While REDCap can be used to collect virtually any type of data in any environment, it is specifically geared to support online and offline data capture for research studies and operations. Please visit the [offical Website](https://projectredcap.org/) for more information.

## Already implemented features
- complete Webservice installation
- complete Database installation
- permission handling
- initial REDCap configuration
- SSL out of the box

## Project structure
In the folder **Webservice** are all components for building the Webapplication. The Web-**Dockerfile** is based on the [official php docker container](https://hub.docker.com/_/php) with a apache2 integration. The **script** folder contains all scripts for the automated installation. In the **src** folder you have to insert the offical REDCap source files as a .zip package. For the SSL configuration you need the **ssl** folder. Your own key and the associated certificate must be inserted in the subfolders.<br></br>
The folder **MariaDB** contains all components for building the database. The DB-**Dockerfile** is based on the [official MariaDB docker container](https://hub.docker.com/_/mariadb)<br></br>
The most important file is the .env file which contains all private variables for the REDCap system. These must be set before the start.

## Requirements
- **The REDCap Source Files:**<br>
REDCap is a closed source project. To get access to the source files you have to request them from [official REDCap Website](https://projectredcap.org/) first.

- **Docker:**<br>
To start the REDCap docker container, Docker is required on the host system. For the installation follow the [official Docker installation](https://docs.docker.com/get-docker/).

- **Docker-compose:**<br>
In this project we managed the several container throw the docker-compose framework. For the installation follow the [official Docker Compose installation](https://docs.docker.com/compose/install/)

## Installation
First, download or clone the repository:
```sh
sudo git clone https://github.com/Pfleiderer-Adrian/REDCap-dockerized.git
```  

Next, we need to add redcap's official source files (zipped) to the **Webservice/src** folder in the repository:
```sh
cd path/to/REDCap-dockerized/Webservice/src
sudo cp path/to/sourcefiles/redcapxx.x.x.zip path/to/REDCap-dockerized/Webservice/src
```  

For the SSL configuration we need to add the SSL certificate into the **Webservice/ssl** folder in the repository. The key must be stored in the key folder and the certificate in the crt folder.
If you don't already have an SSL certificate and a key, you can easily create one for development purposes (not production!!).
With openssl:
```sh
cd /path/to/REDCap-dockerized
sudo openssl req -x509 -nodes -days 356 -newkey rsa:2048 -keyout REDCap-dockerized/Webservice/ssl/key/redcap.key -out REDCap-dockerized/Webservice/ssl/crt/redcap.crt
```

Last step is to edit the .env file and set the nessecery credentials with a text editor.  

| Value | Description | Change necessary? |
| ------------- | ------------- | ------------- |
| MYSQL_ROOT_PASSWORD | The root password for your Database | YES!!! |
| MYSQL_DATABASE | The database name for REDCap | NO |
| MYSQL_USER | The database user for the application | NO |
| MYSQL_PASSWORD | The password for the user | YES!!! |
| REDCAP_BASE_URL | The url for your application. E.g. https://localhost/redcap for development | YES |
| REDCAP_VERSION | The version of your source files. Name format: xx.x.x (only digets and dot) | YES |
| INSTITUTION | Your instition name | NO for development. YES for production |
| DEPARTMENT | Your department name | NO for development. YES for production |
| CONTACT_EMAIL | Your admin email | NO for development. YES for production |
| ADMINISTRATOR_NAME | Your admin name | NO for development. YES for production |

> NOTE: All values must be set. No empty values allowed.

Finally we can build and execute our image:
```sh
cd path/to/REDCap-dockerized
sudo docker-compose up -d --build
```
After the image are build successfully please wait a minute. After that you can check [your URL](https://localhost/redcap). You should see a fully working REDCap system. :)

## Access a component with a shell
If you want to change something in the webservice docker image you can run:
```sh
cd path/to/REDCap-dockerized
sudo docker exec -it redcap-web bash
```

If you want to change something in the database docker image you can run:
```sh
cd path/to/REDCap-dockerized
sudo docker exec -it redcap-db bash
```

## Upcoming Features
- mailing service (currently not working out-of-the-box)

## License

MIT

## References
This work uses and is based on the great REDCap software. Please look at these papers:

[PA Harris, R Taylor, R Thielke, J Payne, N Gonzalez, JG. Conde, Research electronic data capture (REDCap) – A metadata-driven methodology and workflow process for providing translational research informatics support, J Biomed Inform. 2009 Apr;42(2):377-81.](http://www.sciencedirect.com/science/article/pii/S1532046408001226)

[PA Harris, R Taylor, BL Minor, V Elliott, M Fernandez, L O’Neal, L McLeod, G Delacqua, F Delacqua, J Kirby, SN Duda, REDCap Consortium, The REDCap consortium: Building an international community of software partners, J Biomed Inform. 2019 May 9 doi: 10.1016/j.jbi.2019.103208](https://www.sciencedirect.com/science/article/pii/S1532046419301261)
