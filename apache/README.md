# Installation de l'image Docker: Apache-PHP-MySQL
## Installation
    docker pull php:apache
    docker pull mysql:latest

## Start PHP-Apache & MySQL 
    docker run -d --name apache -p 80:80 -v /srv/docker/apache/:/var/www/ php:apache
    docker run -d --name mysql -p 3306:3306 mysql:latest

## Création via un Docker-Compose 
> On créée un fichier: `docker-compose.yml`

    apache:
        image: php:apache
        volumes:
        - "/srv/php:/var/www/html"
        links:
        - mysql
        ports:
        - "80:80"
        privileged: true

    mysql:
        image: mysql:latest
        volumes:
        - "/srv/sql:/var/lib/mysql"
        environment:
         MYSQL_ROOT_PASSWORD: passroot
        privileged: true

> On lance notre Docker-Compose : <br />
`docker-compose up`

## Shell Access - Maintenance: 
`docker exec -it <apache> bash`<br />
`docker exec -it <mysql> bash`

### Delete  the exited containers 
`sudo docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm`

### Arrêt et démarrage du docker
    docker start/stop <apache>
    docker start/stop <mysql>

### Editer fichiers config 
* On rentre dans l'image Docker via la commande > docker exec

## Configuration de Apache 
### Ajout des pages web dans les dossiers correspondants
> On ajoute chaque sites correspondants dans un dossier spécifique pour la création des vHosts.
* `/var/www/www` pour la page web.
* `/var/www/b2b` pour la page b2b.
* `/var/www/intranet` pour la page intranet.

### Création d'hôtes virtuels 
> On créée un fichier basé sur `00_default.conf` qui se trouve dans le dossier `/etc/apache2/sites-available`. 

Contenu du fichier nommé `sites_config.conf`: 
* **vHost pour la page web/www :** <br />

    `<VirtualHost *:80>` <br />
       `ServerAdmin c.gossiaux@students.ephec.be`<br />
       `ServerName www.wt7.ephec-ti.be`<br />
       `ServerAlias wt7.ephec-ti.be`<br />
       `DocumentRoot /var/www/www`<br />
       `ErrorLog ${APACHE_LOG_DIR}/error.log`<br />
       `CustomLog ${APACHE_LOG_DIR}/access.log combined`<br />
    `</VirtualHost>`

* **vHost pour la page b2b/php :** <br />

    `<VirtualHost *:80>` <br />
       `ServerAdmin c.gossiaux@students.ephec.be`<br />
       `ServerName b2b.wt7.ephec-ti.be`<br />
       `ServerAlias wt7.ephec-ti.be`<br />
       `DocumentRoot /var/www/b2b`<br />
       `ErrorLog ${APACHE_LOG_DIR}/error.log`<br />
       `CustomLog ${APACHE_LOG_DIR}/access.log combined`<br />
    `</VirtualHost>`

* **vHost pour la page intranet :** <br />

    `<VirtualHost *:80>`<br />
       `ServerName intranet.wt7.ephec-ti.be`<br />
       `DocumentRoot /var/www/intranet`<br />
       `<Directory /var/www/intranet>`<br />
	   `Allow from 151.80.119.151`<br />
	   `Deny from all`<br />
       `</Directory>`<br />
       `ErrorLog ${APACHE_LOG_DIR}/error.log`<br />
       `CustomLog ${APACHE_LOG_DIR}/access.log combined`<br />
    `</VirtualHost>`

> On utilise les options `Allow from` et `Deny from` pour restreindre l'accès au site.

## Configuration de MySQL 

> Il s'agit avant tout de la création d'une base de donnée en mode commande.
* Il faut d'abord se connecter à MySQL via la commande :
`mysql -h localhost -u root -p`
> * -h défini l'hôte, donc soit une NS ou une ip.
> * -u défini l'utilisateur, par défaut, `root`.
> * -p défini le password, inscrit plus tôt dans le Docker-Compose ou est `vide`par défaut.

* On crée la base de données avec la commande : <br />
`CREATE DATABASE db_wt7;`
* On crée une table avec la commande : <br /> 
`CREATE TABLE db_Table (id tinyint(3), produits varchar(100), qte tinyint(3));`
* On ajoute des données à cette table avec la commande : <br /> 
`INSERT INTO 'db_Table' VALUES (1, "Jouet en bois", 25);`
* Création d'un utilisateur ayant tous les droits sur la base de donnée : <br />
`GRANT ALL PRIVILEGES ON db_Table.* TO user@localhost IDENTIFIED BY "mot_de_passe";`

 
