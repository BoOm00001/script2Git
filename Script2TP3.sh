#!/bin/bash

MDPADMIN="admin24"
echo "Entrez votre nom :"
read NOM_UTILISATEUR

echo "Le nom de votre poste de travail :"
read NOM_POSTE_DE_TRAVAIL

while grep -q "^$NOM_UTILISATEUR:" /etc/passwd; do
    echo "L'utilisateur $NOM_UTILISATEUR existe déjà, veuillez choisir un autre nom."
    read NOM_UTILISATEUR
done

# Crée un utilisateur sans mot de passe et affichage
echo "$MDPADMIN" | sudo -S adduser --gecos "" --allow-bad-names --disabled-password --quiet "$NOM_UTILISATEUR"

UTILISATEUR_HOME="/home/$NOM_UTILISATEUR/Bienvenue"


sudo mkdir -p "$UTILISATEUR_HOME"
sudo chown "$NOM_UTILISATEUR:$NOM_UTILISATEUR" "$UTILISATEUR_HOME"
sudo chmod u+rwx "$UTILISATEUR_HOME"


FICHIER_BIENVENUE="$UTILISATEUR_HOME/fichier.txt"

sudo -u "$NOM_UTILISATEUR" bash -c "echo 'Bienvenue $NOM_UTILISATEUR sur votre nouveau poste de travail $NOM_POSTE_DE_T>
sudo -u "$NOM_UTILISATEUR" bash -c "echo 'Votre répertoire de travail est : $UTILISATEUR_HOME (Droits : propriétaire un>


sudo -u "$NOM_UTILISATEUR" bash -c "ip addr show | grep 'inet' | grep -v '127.0.0.1' | awk '{print \$2}' | cut -d/ -f1 >


echo "Utilisateur $NOM_UTILISATEUR créé avec succès et répertoire de bienvenue configuré."


echo "$MDPADMIN " | sudo cat "$FICHIER_BIENVENUE"

