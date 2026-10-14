#!/bin/bash

#écrire un fichiel template
MAIL="mail.tex"
PERS="personnels_enseirb.csv"

OLDIFS="$IFS"
IFS=$'\n'

for line in $(cat "$PERS")
do
    nom=$(echo $line | cut -d: -f1)
    prenom=$(echo $line | cut -d: -f2)
    num=$(echo $line | cut -d: -f3)

    echo "$nom $prenom $num"
    
    cp "$MAIL" "$nom$prenom.tex"
    
    sed -i "s/__Prenom__/$prenom/" "$nom$prenom.tex"
    sed -i "s/__Nom__/$nom/" "$nom$prenom.tex"
    sed -i "s/__numBureau__/$num/" "$nom$prenom.tex"

    pdflatex "$nom$prenom.tex"

    rm "$nom$prenom.tex"
    rm "$nom$prenom.log"
    rm "$nom$prenom.aux"
done

IFS="$OLDIFS"


