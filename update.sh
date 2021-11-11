#!/bin/bash
clear

echo "Actualizando todo el repositorio"

git add .

echo 'Escribe mensaje de "commit":'
read comm
mensaje="$comm "`date`
git commit -m "$mensaje"

git push

