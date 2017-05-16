# MYSQL with APACHE-PHP

## Lancement de l'image MYSQL avec le docker-compose 

    # apache et php
    # php:apache officiel
    php:
    mage: nimmis/apache-php5
    container_name: apache-php
    ports:
     - 80:80
     - 443:443
    volumes:
     - /srv/docker/apache/conf:/etc/apache2
     - /srv/docker/apache/html:/var/www/html
     - /srv/docker/apache/logs:/var/log/apache2
     - /srv/docker/apache/ssl:/etc/ssl/certs/wt7
    links:
     - db

    # sql
    # mariadb
    db:
    image: mysql/mysql-server:5.6
    container_name: db
    environment:
     - MYSQL_ROOT_PASSWORD=rootPassword
     - MYSQL_USER=wt7
     - MYSQL_DATABASE=web_db
     - MYSQL_PASSWORD=password
    ports:
     - 3306:3306

     
## Gérer l'image/bases de données 
- Exécuter la commande pour rentrer dans le containeur: 
    
    docker exec -it mysql bash

- Importer ses bases de données via le Volume: 
    
    #PAS MIS EN PLACE

## Commandes de bases dans la console mysql
    mysql -u root -p # Connexion à la console sql
    SHOW DATABASES;  # afficher les bdd
    DROP DATABASE db_name; # supprimer une bdd
    USE db_name; SHOW tables; # utiliser une bdd spécifique
    DELETE from table_name where column_name=something; # delete une table

## Création d'un utilisateur avec droits d'accès universelle 
    CREATE USER 'sysAdmin'@'%' IDENTIFIED BY 'sysPassword';
    GRANT ALL PRIVILEGES ON *.* TO 'sysAdmin'@'%'; 
 
## Création d'une base de donnée
    CREATE DATABASE web;

## Ajout de tables 
    CREATE TABLE wt7(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,nom VARCHAR(20),prenom VARCHAR(20));

## Ajout de valeurs dans une table
    
    INSERT INTO `wt7` (`nom`, `prenom`) VALUES ("Gossiaux", "Christophe");
    INSERT INTO `wt7` (`nom`, `prenom`) VALUES ('Voss', 'Nathan');
    INSERT INTO `wt7` (`nom`, `prenom`) VALUES ('Maes', 'Arnaud');


