# OBJECTIFS MISSION 1   
## Github
- [x] Le groupe a un Github. 
- [x] Les configs sont sur le Github. 
- [ ] Les configs sont claires et commentées [NEED TO COMMENT]
## Wiki 
- [x] Wiki présent.
- [x] Wiki goddamnement bien organisé!
- [x] Wiki exhaustif. 
- [x] Le Wiki permet la reproduction de l'installation des services.
- [ ] Le Wiki documente clairement les opérations de maintenance de chaque service (ajout user, gestion état, etc)
## Généralités 
- [x] Utilisation de volumes/Dockerfiles avec Docker. 
- [x] Architecture réseau stucturée et réfléchie (?)
- [ ] Informations fonctionnement des services accessibles et permettent le monitoring (?)
## Sécurisation des VPS 
- [x] Vps avec clefs d'authentifications
    * Nathan (OK)
    * Arnaud (?)
    * Christophe (OK)
- [x] Vps refusent l'accès SSH(root)
- [x] Fail2Ban installé. 
- [x] Seuls les ports demandés sont ouverts. 
- [x] Firewall (installé mais non configuré). 
- [ ] Architecture DMZ (?)
## Délivrables 
- [x] Rapport fourni 
- [x] Forme rapport correcte 
- [x] Cahier des charges complet et bien rédigé
- [x] Traduction CdC en language informatique
- [ ] Un schéma réseau est disponible
- [x] Architecture DNS documentée et justifiée
## Serveur de noms
- [x] Le NS est configuré au niveau de la zone parent
- [x] Le NS est joignable sur le port 53
- [x] Le NS répond aux requêtes DNS sur la zone wtX
- [x] Le SOA est correct
- [x] Les RR des 3 sites web sont présents
- [x] Le RR NS est OK
## Résolveur DNS **[A FAIRE]**
- [ ] Un résolveur est disponible pour les employés
- [ ] Le résolveur fonctionne de manière adéquate
- [ ] Le résolveur n'est accessible que pour les employés
## Web 
- [x] Le choix de l’architecture web est justifié et documenté
- [x] le site www.wtX.ephec-ti.be fournit une page HTML
- [x] Le site b2B.wtX.ephec-ti.be fournit une page HTML
- [x] Le serveur b2B.wtX.ephec-ti.be a accès à une base de données
- [x] Le site intranet.wtX.ephec-ti.be fournit une page HTML
- [x] Le site intranet.wtX.ephec-ti.be n’est accessible que par les employés (ex : seule une adresse IP spécifique y a accès)
- [ ] Un proxy est mis en place pour la navigation web des employés
- [x] Un reverse proxy est mis en place pour protéger les serveurs
- [x] D’autres fonctionnalités web intéressantes sont mises en place, en cohérence avec le CdC

