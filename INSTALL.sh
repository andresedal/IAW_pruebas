#!/bin/bash
clear
# Check4Update
git remote update
UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    echo -e "\e[42mActualizado\e[0m"
elif [ $LOCAL = $BASE ]; then
    echo -e "\e[41mNecesita actualizar en local\e[0m"
    git pull
elif [ $REMOTE = $BASE ]; then
    echo "\e[43mNecesita actualizar en remoto\e[0m"
else
    echo "Diverged"
fi
echo " "
# MENU 
PS3='Seleccionar una opción: '
options=("Listar Usuarios" "Crear Usuarios" "Borrar Usuarios" "Opciones repositorio" "salir")
select opt in "${options[@]}"
do
    case $opt in
        "Listar Usuarios")
            echo -e "\e[31m$opt\e[0m"
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
        "Actualizar repositorio")
            git pull
            ;;
        "salir")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done