# Mailserver 
> based on hardware/mailserver image 
> https://github.com/hardware/mailserver

## Dépendances 
L'image de hardware/mailserver tourne avec d'autres images pour permettre un service complet :
- **postfixadmin :** pour avoir une administration simplifiée via une interface web.
- **rainloop :**  interface web pour consulter ses mails. 
- **nginx :** serveur web pour gérer *postfixadmin* et *rainloop*.
- **mariadb :** base de données contenant les mots de passes des users pour PostfixAdmin

## Démarrage des services 
On utilise un `docker-compose` :
> Voir [docker-compose](https://github.com/SuperKumKum/SysAdmin-ll_Project/blob/master/mailserver/docker-compose.yml)

## Modification du fichier Bind9
- On ajoute d'abord le MX pour le mail : 
  `@ INMX	10	mail.wt7.ephec-ti.be.`
- On ajoute ensuite l'ip pour joindre le mail et la domain.key : 
  `mailINA	151.80.119.127`
  `mail._domainkey IN      TXT     ( "v=DKIM1; k=rsa; " ... )`
> La DKIM (Domain Keys Identified Mail) est générée avec OpenDKIM et se retrouve dans le dossier approprié dans l'image `mail` dans un dossier [DKIM](https://github.com/SuperKumKum/SysAdmin-ll_Project/blob/master/mailserver/mail/opendkim/wt7.ephec-ti.be/mail.txt).

- On ajoute ensuite une entrée pour joindre les interfaces WEB : 
  `service	IN	A	151.80.119.127`
  `postfixadmin  IN	CNAME	service`
  `webmail	IN	CNAME	service`
> L'interface web Postfixadmin sera  accessible via [postfixadmin.wt7.ephec-ti.be](postfixadmin.wt7.ephec-ti.be).
> L'interface web Looprain sera accessible via [webmail.wt7.ephec-ti.be](webmail.wt7.ephec-ti.be).

## Création de certiticats  pour le domaine mail et les pages web d'administrations
- Il faut d'abord stop le container NGINX avec : `docker-compose stop nginx`
- Ensuite, on génère les certificats via l'image de *xataz/letsencrypt*

`docker run -it --rm \`
`-v /mnt/docker/nginx/certs:/etc/letsencrypt \`
`-p 80:80 -p 443:443 \`
`xataz/letsencrypt \`
`certonly --standalone \`
`--rsa-key-size 4096 \`
`--agree-tos \`
`-m contact@wt7.ephec-ti.be \`
`-d mail.wt7.ephec-ti.be \ # <--- Mail FQDN is the first domain name, very important !`
`-d webmail.wt7.ephec-ti.be \`
`-d postfixadmin.wt7.ephec-ti.be`
- On relance le container NGINX : `docker-compose up -d`
- Les certificats sont prêts à être utilisés pour l'étape suivante.

## Ajout de VirtualHosts pour PostfixAdmin et RainLoop
Il nous faut nous ajouter des VirtualHosts sécurisé pour avoir accès aux pages de gestions WEB de PostfixAdmin et Rainloop.. Et bien évidemment pour avoir un WebMail qui est sécurisé pour l'utilisateur. 
### PostfixAdmin 
    docker exec -ti nginx ngxproxy
    Welcome to ngxproxy utility.
    We're about to create a new virtual host (AKA server block).
    
    Name: postfixadmin
    Domain: postfixadmin.wt7.ephec-ti.be
    Webroot (default is /): 
    Container: postfixadmin
    Port (default is 80): 8888
    HTTPS [y/n]: y
    Certificate path: /certs/live/wt7.ephec-ti.be/fullchain.pem
    Certificate key path: /certs/live/wt7.ephec-ti.be/privkey.pem
    Secure headers [y/n]: y
    Enable HSTS header ? [y/n]: n # Use with caution
    Max body size in MB (integer/null): null
    
    Done! postfixadmin.conf has been generated.
    Reload nginx now? [y/n]: y
    nginx successfully reloaded.


### Rainloop 
> Voir <u>PostfixAdmin</u> et changer pour Rainloop

## NB
> Arrivé à cette étape, l'accès au pages web (Postfix et Webmail) est fonctionnel, les changements sur le dns permettent un envoie de mail et une réception de mail, il faut maintenant configurer Postfix et créer des utilisateurs. 

# Configuration initiale de PostfixAdmin 
1. Accéder à la page de configuration : [postfixadmin.wt7.ephec-ti.be/setup.php](postfixadmin.wt7.ephec-ti.be/setup.php).

2. Définir le mot de passe de configuration
  :bulb: Un hash code s'affichera, il faut le copier/coller.

3. Configurer le hash
  `docker exec -ti postfixadmin setup`
  `> Postfixadmin setup hash : [votreHashCode]`
  `> Setup done.`

4. Créer un compte Administrateur

   ![createAdmin](https://puu.sh/vM8G9/6fd7345856.png)
5. Lancer [postfixadmin.wt7.ephec-ti.be/](postfixadmin.wt7.ephec-ti.be) et se connecter avec le compte Administrateur. 

## Ajout d'un domaine
1. Se rendre dans l'onglet "Liste domaines" et sélectionner "Nouveau"
2. Remplir la configuration
  ![addDomain](https://puu.sh/vM8VC/e51a149f5a.png)
  - On peut préselectionner la taille de boites mails de chaque adresse mail, donner une valeur maximal pour le domaine et supprimer les aliases.

## Création d'un mail/utilisateur 
1. Se rendre dans l'onglet "Liste Virtuels" et "Ajouter un compte"
2. Remplir la configuration
  ![addUser](https://puu.sh/vM55I/01f613089e.png)
3. Le mail est actif et fonctionnel!

## Création d'un alias
1. Onglet "Liste Virtuels" et "Ajouter Alias"
  ![addAlias](https://puu.sh/vM5eM/93ab4d6722.png)

## Fetchmail/Récup de mail sur un autre compte
1. Il faut activer l'opiton FETCHMAIL dans l'image mailserver
2. On ajoute cette ligne dans notre [docker-compose].

`environment:`
  - `ENABLE_FETCHMAIL=true`
3. Ensuite on configure sous PostfixAdmin
  ![addFetch](https://puu.sh/vM5nU/f1fb3dd6e8.png)
