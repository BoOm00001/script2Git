#!/bin/bash
 
 set -e
NOM=0
MDPADMIN="admin24"
echo "Entrez votre nom:"
read NOM_UTILISATEUR

while grep -q "^$NOM_UTILISATEUR:" /etc/passwd; do
echo "L'utilisateur $NOM_UTILISATEUR est existant veillez choisir un autre nom"
read NOM_UTILISATEUR
done

UTILISATEUR_HOME="/home/$NOM_UTILISATEUR"
echo "$MDPADMIN" |  sudo adduser --quiet --disabled-password --geco "" "$NOM_UTILISATEUR"
sudo su $NOM_UTILISATEUR |
OM_UTILISATEUR" "$UTILISATEUR_HOME/BienvenueYes
ip addr show | grep "inet " | awk '{print $2}' | cut -d/ -f1
