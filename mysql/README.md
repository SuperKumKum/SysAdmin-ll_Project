# MYSQL with APACHE-PHP

## Lancement de l'image MYSQL avec le docker-compose 

Voir 

## Commandes de bases dans la console mysql
    mysql -u root -p
    SHOW DATABASES; 
    DROP DATABASE db_name; 
    USE db_name; SHOW tables;
    DELETE from table_name where column_name=something;

## Création d'un utilisateur avec droits d'accès universelle 
    CREATE USER 'sysAdmin'@'%' IDENTIFIED BY 'sysPassword';
    GRANT ALL PRIVILEGES ON *.* TO 'sysAdmin'@'%'; 
 
## Création d'une base de donnée
    CREATE DATABASE web;
