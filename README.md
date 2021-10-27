
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
El Script configurará automaticamente las webs. Tiene en cuenta el usuario que la ejecuta.
También hara "pull" antes de hacer nada, para tener los archivos actualizados.

## "Update.sh"
Actualiza todos los archivos en el repositorio, y hara un commit
preguntando el mensaje y añadira la fecha y hora.
