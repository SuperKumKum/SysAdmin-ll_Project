# MYSQL with APACHE-PHP

## Lancement de l'image MYSQL avec le docker-compose 

    version: '2'

    services:
    php:
    image: nimmis/apache-php5
    container_name: apache
    ports:
      - "80:80"  
      - "443:443"
    volumes:
      - /srv/docker/apache:/var/www/html
    links:
      - db

    db:
    image: mysql/mysql-server:5.6
    container_name: mysql 
    environment:
     - MYSQL_ROOT_PASSWORD=hunter2

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


