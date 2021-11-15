#!/bin/bash
read -p 'Escriba el nombre completo: ' nombrecompleto
read -p 'Escriba el nombre de usuario: ' nombre
nombreunico=$nombre$RANDOM
echo "Nombre de usuario $nombreunico"
psw1=$(date +%s | sha256sum | base64 | head -c 4)
psw2=$(date +%s | sha256sum | base32 | head -c 4)  
pswd="$psw1""$psw2""$RANDOM"

echo "Contraseña auto generada ${pswd:0:1}*******${pswd:12:13}"

# FALTA ADDUSER

adduser --gecos "$nombrecompleto" --no-create-home --home /var/www/$nombreunico --shell /bin/false $nombreunico

mkdir /var/www/$nombreunico/{web,blog,files}
chown root:root /var/www/$nombreunico
chmod 755 /var/www/
chown -R $usuariounico:$usuariounico /var/www/$nombreunico/*

echo "Match User $usuariounico
        ChrootDirectory /var/www/$usuariounico/
        PasswordAuthentication yes"\n >> /etc/ssh/sshd_config

