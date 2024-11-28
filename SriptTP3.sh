#!/bin/bash

# Initialise la distance vers l'Ouest en kilomètres
OUEST=400
# Calcule la distance vers le Sud (200 km de moins que l'Ouest)
SUD=$(($OUEST-200))
# Calcule la distance vers l'Est (300 km de plus que le Sud)
EST=$((300 + $SUD))
# Calcule la distance vers le Nord (somme du Sud et de l'Est)
NORD=$(($SUD + $EST))

# Affiche les distances calculées, en précisant les unités
echo "Le Nord est à $NORD mètres le Sud à $SUD kilomètre"
echo "L'Est est à $EST kilomètre et l'OUEST est $OUEST kilomètres" 

# Compare les distances pour déterminer le chemin le plus court
if [ $SUD -lt $EST ];then 
# Si le Sud est plus court que l'Est, on le considère comme la meilleure option
CHEMIN_COURT=$SUD
echo " Le Sud est alors la meilleur option"

elif [ $NORD -lt $SUD ];then
# Si le Nord est plus court que le Sud, c'est le meilleur choix
CHEMIN_COURT=$NORD
echo"Le Nord est alors la meilleur option"
# Si l'Est est plus court que le Nord, il devient l'option privilégiée
elif [ $EST -lt $NORD ];then
CHEMIN_COURT=$EST
echo"L'Est est donc la meilleur option."

else
# Si aucune des conditions ci-dessus n'est remplie, l'Ouest est le plus court
echo"L'Ouest est le chemin le plus court."

fi

