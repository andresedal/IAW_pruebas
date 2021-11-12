#!/bin/bash
read -p 'Nombre de usuario: ' nombre
nombreunico=$nombre$RANDOM
echo "Nombre de usuario $nombreunico"
psw1=$(date +%s | sha256sum | base64 | head -c 4)
psw2=$(date +%s | sha256sum | base32 | head -c 4)  
pswd="$psw1""$psw2""$RANDOM"

echo "Contraseña auto generada ${pswd:0:1}*******${pswd:12:15}"
echo $pswd
# adduser

# mkdir /var/www/$nombreunico/{web,blog,files}
# chown root:root /var/www/$nombreunico
# chown $nombreunico:$nombreunico /var/www/$nombreunico/*
# chmod -R 755 /var/www/

