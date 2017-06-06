#!/bin/bash 
# Lancement du firewall 
echo "Script de lancement du firewall"

echo "Mise à jours des paquets"  
sudo apt-get update
echo "bloquage trafic entrant" 
sudo ufw default deny inconming
echo "autorisation trafic sortant" 
sudo ufw default allow outgoing

echo "Port ssh"
# port ssh: 22
sudo ufw allow 22/tcp 

echo "Port dns"
# port dns: 53 
sudo ufw allow 53

echo "Ports Web"
# ports http et https + autres ports web ouvert
sudo ufw allow proto tcp from any to any port 80,443,8000,4430,8888,8080

echo "Ports mail"

echo "mail in" 
sudo ufw allow 25
sudo ufw allow 587 

echo "mail out"
sudo ufw allow 110
sudo ufw allow 993

echo "Ports asterisk" 
sudo ufw allow 5060
sudo ufw allow 4569 
sudo ufw allow 10000:20000/udp

echo "Activation du firewall" 
sudo service ufw start
sudo ufw enable
