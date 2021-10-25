#!/bin/bash
echo "$(whoami)"

[ "$UID" -eq 0 ] || exec sudo "$0" "$@"

echo "Clonar directorio"
git clone https://github.com/ismaelct/IAW_pruebas.git

echo "Configurando espacios web"
mkdir -p /var/www/web01
mkdir -p /var/www/web02
mkdir -p /var/www/web03
# 1
cp web01/config.conf /etc/apache2/sites-available/web01.conf
cp web01 /var/www/web01
# 2
cp web02/web02.conf /etc/apache2/sites-available/web02.conf
cp web02 /var/www/web02
# 3
cp web03/web03.conf /etc/apache2/sites-available/web03.conf
cp web03 /var/www/web03
echo "Habilitando espacios web"
# Habilitar sitios
a2ensite web01.conf
a2ensite web02.conf
a2ensite web03.conf
