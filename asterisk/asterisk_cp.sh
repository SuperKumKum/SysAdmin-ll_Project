#!/bin/bash
#  Script qui copie les fichiers conf de l'image Asterisk permettant le montage de volumes. 
docker cp -L asterisk:/etc/asterisk/asterisk.conf /mnt/docker/asterisk/
docker cp -L asterisk:/etc/asterisk/extensions.conf /mnt/docker/asterisk/
docker cp -L asterisk:/etc/asterisk/acl.conf /mnt/docker/asterisk/
docker cp -L asterisk:/etc/asterisk/iax.conf /mnt/docker/asterisk/
docker cp -L asterisk:/etc/asterisk/rtp.conf /mnt/docker/asterisk/ 
docker cp -L asterisk:/etc/asterisk/sip.conf /mnt/docker/asterisk/
docker cp -L asterisk:/etc/asterisk/users.conf /mnt/docker/asterisk/
docker cp -L asterisk:/etc/asterisk/voicemail.conf /mnt/docker/asterisk/
exit 0
