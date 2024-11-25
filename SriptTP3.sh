#!/bin/bash

OUEST=400
SUD=$(($OUEST-200))
EST=$((300 + $SUD))
NORD=$(($SUD + $EST))

echo "Le Nord est à $NORD mètres le Sud à $SUD kilomètre"
echo "L'Est est à $EST kilomètre et l'OUEST est $OUEST kilomètres" 

if [ $SUD -lt $EST ];then 
CHEMIN_COURT=$SUD
echo " Le Sud est alors la meilleur option"

elif [ $NORD -lt $SUD ];then
CHEMIN_COURT=$NORD
echo"Le Nord est alors la meilleur option"
elif [ $EST -lt $NORD ];then
CHEMIN_COURT=$EST
echo"L'Est est donc la meilleur option."

else
echo"L'Ouest est le chemin le plus court."

fi

