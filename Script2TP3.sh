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

