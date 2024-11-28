#!/bin/bash

# Déclare un mot de passe administrateur (nécessaire pour les commandes sudo)
MDPADMIN="admin24"

# Demande à l'utilisateur d'entrer son nom
echo "Entrez votre nom :"
read NOM_UTILISATEUR

# Demande à l'utilisateur d'entrer le nom de son poste de travail
echo "Le nom de votre poste de travail :"
read NOM_POSTE_DE_TRAVAIL

# Vérifie si l'utilisateur existe déjà dans le fichier /etc/passwd
while grep -q "^$NOM_UTILISATEUR:" /etc/passwd; do
    echo "L'utilisateur $NOM_UTILISATEUR existe déjà, veuillez choisir un autre nom."
    read NOM_UTILISATEUR
done

# Crée un nouvel utilisateur sans mot de passe (les options permettent de désactiver le mot de passe et éviter les invites supplémentaires)
echo "$MDPADMIN" | sudo -S adduser --gecos "" --allow-bad-names --disabled-password --quiet "$NOM_UTILISATEUR"

# Définit le chemin du répertoire personnel de l'utilisateur
UTILISATEUR_HOME="/home/$NOM_UTILISATEUR/Bienvenue"

# Crée le répertoire "Bienvenue" dans le dossier personnel de l'utilisateur
sudo mkdir -p "$UTILISATEUR_HOME"

# Change le propriétaire et le groupe du répertoire pour qu'il appartienne à l'utilisateur
sudo chown "$NOM_UTILISATEUR:$NOM_UTILISATEUR" "$UTILISATEUR_HOME"

# Attribue les permissions nécessaires (lecture, écriture, exécution) pour le propriétaire
sudo chmod u+rwx "$UTILISATEUR_HOME"

# Chemin du fichier texte contenant les messages de bienvenue
FICHIER_BIENVENUE="$UTILISATEUR_HOME/fichier.txt"

# Écrit un message de bienvenue personnalisé dans le fichier texte en tant que nouvel utilisateur
sudo -u "$NOM_UTILISATEUR" bash -c "echo 'Bienvenue $NOM_UTILISATEUR sur votre nouveau poste de travail $NOM_POSTE_DE_TRAVAIL.' > '$FICHIER_BIENVENUE'"
# Ajoute une information sur le répertoire de travail dans le fichier texte
sudo -u "$NOM_UTILISATEUR" bash -c "echo 'Votre répertoire de travail est : $UTILISATEUR_HOME (Droits : propriétaire seul).' >> '$FICHIER_BIENVENUE'"

# Ajoute l'adresse IP de la machine au fichier texte (exclut l'adresse loopback 127.0.0.1)
sudo -u "$NOM_UTILISATEUR" bash -c "ip -4 addr show | awk '/inet / && !/127.0.0.1/ {print \$2}' | cut -d/ -f1 >> '$FICHIER_BIENVENUE'"

# Affiche un message de confirmation que l'utilisateur et son répertoire ont été créés avec succès
echo "$MDPADMIN" | sudo echo "Utilisateur $NOM_UTILISATEUR créé avec succès et répertoire de bienvenue configuré."

# Affiche le contenu du fichier texte contenant les informations de bienvenue
echo "$MDPADMIN " | sudo cat "$FICHIER_BIENVENUE"
