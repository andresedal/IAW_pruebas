#!/bin/bash
# PREGUNTAS
read -p 'Escriba el nombre completo: ' nombrecompleto
read -p 'Escriba el nombre de usuario: ' nombre
nombreunico=$nombre$RANDOM
echo "Nombre de usuario $nombreunico"
psw1=$(date +%s | sha256sum | base64 | head -c 4)
psw2=$(date +%s | sha256sum | base32 | head -c 4)  
pswd="$psw1""$psw2""$RANDOM"

echo "Contraseña auto generada ${pswd:0:1}*******${pswd:12:13}"
# CREAR USUARIO
adduser --gecos "$nombrecompleto" --no-create-home --home /var/www/$nombreunico --shell /bin/false $nombreunico
# CREAR DIRECTORIOS DE USUARIO
mkdir -p /var/www/$nombreunico/{web,blog,files}
# PERMISOS Y CHROOT
chown root:root /var/www/$nombreunico
chmod 755 /var/www/
chown -R $usuariounico:$usuariounico /var/www/$nombreunico/*
# CHROOT JAULA SFTP SSH
echo "Match User $usuariounico
        ChrootDirectory /var/www/$usuariounico/
        PasswordAuthentication yes"\n >> /etc/ssh/sshd_config
# CONFIG APACHE
touch /etc/apache2/sites-available/web_$nombreunico.conf
echo "<VirtualHost *:80>
    ServerName $nombreunico.iaw.com
    ServerAdmin root@localhost
    DocumentRoot "/var/www/$nombreunico/web"

    <Directory "/var/www/$nombreunico/web">
        Options -Indexes
        DirectoryIndex index.html
        AllowOverride None
    </Directory>

        AssignUserID $nombreunico $nombreunico

   ErrorLog ${APACHE_LOG_DIR}/error.log
   CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>" >> /etc/apache2/sites-available/web_$nombreunico.conf

touch /etc/apache2/sites-available/blog_$nombreunico.conf
echo "<VirtualHost *:80>
    ServerName blog.$nombreunico.iaw.com
    ServerAdmin root@localhost
    DocumentRoot "/var/www/$nombreunico/blog"

    <Directory "/var/www/$nombreunico/blog">
        Options -Indexes
        DirectoryIndex index.html
        AllowOverride None
    </Directory>

        AssignUserID $nombreunico $nombreunico

   ErrorLog ${APACHE_LOG_DIR}/error.log
   CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>" >> /etc/apache2/sites-available/blog_$nombreunico.conf