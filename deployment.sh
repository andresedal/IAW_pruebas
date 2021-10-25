#!/bin/bash
clear
su -c 'git pull' $(whoami)

echo "Configurando espacios web"

sudo mkdir -p /var/www/web0{1,2,3}

echo "Clonar directorio"

sudo cp -r ./web01/web01.conf /etc/apache2/sites-available/web01.conf
sudo cp -r ./web02/web02.conf /etc/apache2/sites-available/web02.conf
sudo cp -r ./web03/web03.conf /etc/apache2/sites-available/web03.conf

sudo cp -r ./web0{1,2,3} /var/www

sudo rm -r -f /var/www/web01/web01.conf
sudo rm -r -f /var/www/web01/web02.conf
sudo rm -r -f /var/www/web01/web03.conf

sudo chown -R $(whoami):www-data /var/www/web0{1,2,3}

echo "Habilitando espacios web"

sudo a2ensite web0{1,2,3}.conf

sudo systemctl reload apache2
