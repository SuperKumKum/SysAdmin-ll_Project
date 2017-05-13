#!/bin/bash

# Création de fichiers backup de chaque configurations.
mv /mnt/docker/asterisk/asterisk.conf /mnt/docker/asterisk/asterisk.conf.backup
mv /mnt/docker/asterisk/extensions.conf /mnt/docker/asterisk/extensions.conf.backup
mv /mnt/docker/asterisk/sip.conf /mnt/docker/asterisk/sip.conf.backup 
mv /mnt/docker/asterisk/users.conf /mnt/docker/asterisk/users.conf.backup 

# Création de nouveaux fichiers de configurations vides.
touch /mnt/docker/asterisk/asterisk.conf
touch /mnt/docker/asterisk/extensions.conf
touch /mnt/docker/asterisk/sip.conf
touch /mnt/docker/asterisk/users.conf
