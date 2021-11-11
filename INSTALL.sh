#!/bin/bash
clear

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull";
    git pull
elif [ $REMOTE = $BASE ]; then
    echo "Need to push"
else
    echo "Diverged"
fi

# MENU awk -F: '{if($3 > 1000) {print $1}}' /etc/passwd


PS3='Seleccionar una opción: '
options=("Listar Usuarios" "Crear Usuarios" "Borrar Usuarios" "salir")
select opt in "${options[@]}"
do
    case $opt in
        "Listar Usuarios")
            echo "$opt"
            echo "==================="
            awk -F: '{if($3 >= 1000 && $3 < 65534) {print "("$3")>"$1}}' /etc/passwd
            echo "==================="
            ;;
        "Crear Usuarios")
            echo "$opt"
            ;;
        "Borrar Usuarios")
            echo "$opt"
            ;;
        "salir")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done