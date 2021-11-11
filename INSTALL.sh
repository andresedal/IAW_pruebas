#!/bin/bash

# if [ $status = 1 ]; then
#    do 

for 0 in $status
do
# https://stackoverflow.com/questions/3258243/check-if-pull-needed-in-git
UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")
if [ $LOCAL = $REMOTE ]; then
    echo "Repositorio Actualizado."
    status=0
elif [ $LOCAL = $BASE ]; then
    echo "Necesario actualizar repositorio."
    chmod +x ./update.sh
    ./update.sh
    status=1
elif [ $REMOTE = $BASE ]; then
    echo "Falta subir cambios."
else
    echo "Diverged"
fi 
done
