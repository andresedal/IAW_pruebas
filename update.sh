#!/bin/bash
clear
echo "Actualizando todo el repositorio"
git add .
echo 'Escribe mensaje de "commit":'
read comm
git commit -m "$comm"
git push

