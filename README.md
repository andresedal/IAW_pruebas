
# Prueba IAW
En el repositorio tendremos un grupo de 3 paginas web.

He preparado el repositorio entorno a los tres directorios <b>"web0X"</b>,
también teniendo en cuenta que en los ficheros de configuracion (de apache2) de las webs
el "ServerName" será <i>web0X.iaw.com</i>. Por ende yo he modificado mi fichero de hosts
para que así apunte a la ip del servidor

### /etc/hosts (Linux)
<pre>
     192.168.56.10 web01.iaw.com
     192.168.56.10 web02.iaw.com
     192.168.56.10 web03.iaw.com
</pre>

## "Deployment.sh"
<pre>
     ___           _                                  _         _
    /   \___ _ __ | | ___  _   _ _ __ ___   ___ _ __ | |_   ___| |__
   / /\ / _ \ '_ \| |/ _ \| | | | '_ ` _ \ / _ \ '_ \| __| / __| '_ \
  / /_//  __/ |_) | | (_) | |_| | | | | | |  __/ | | | |_ _\__ \ | | |
 /___,' \___| .__/|_|\___/ \__, |_| |_| |_|\___|_| |_|\__(_)___/_| |_|
            |_|            |___/
</pre>
El Script configurará automaticamente las webs. Tiene en cuenta el usuario que la ejecuta.
También hara "pull" antes de hacer nada, para tener los archivos actualizados.

####0. Limpiar la pantalla
$ clear
####1. Actualizamos el repositorio
$ su -c 'git pull' $(whoami)
Explicacion
$ echo "Configurando espacios web"
####2. Creamos los directorios con la opción "-p" en caso de que nos falte alguna carpeta intermedia
$ sudo mkdir -p /var/www/web0{1,2,3}
####Explicacion
$ echo "Clonar directorio"
####3. Copiamos las configuraciones en el directorio de configuraciones de apache
$ sudo cp -r ./web01/web01.conf /etc/apache2/sites-available/web01.conf
$ sudo cp -r ./web02/web02.conf /etc/apache2/sites-available/web02.conf
$ sudo cp -r ./web03/web03.conf /etc/apache2/sites-available/web03.conf
####4. Copiamos las carpetas de las webs en el directorio de las webs
$ sudo cp -r ./web0{1,2,3} /var/www
####5. Al estar la configuración implícita en las carpetas de las webs la borramos de las carpetas copiadas
$ sudo rm -r -f /var/www/web01/web01.conf
$ sudo rm -r -f /var/www/web01/web02.conf
$ sudo rm -r -f /var/www/web01/web03.conf
####6. Cambiamos el dueño de los archivos y directorios
$ sudo chown -R $(whoami):www-data /var/www/web0{1,2,3}
Expliacion
$ echo "Habilitando espacios web"
####7. Habilitamos los sitios web y recargamos apache
$ sudo a2ensite web0{1,2,3}.conf
$ sudo systemctl reload apache2


## "Update.sh"
Actualiza todos los archivos en el repositorio, y hara un commit
preguntando el mensaje y añadira la fecha y hora.
