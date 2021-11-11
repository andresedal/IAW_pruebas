#!/bin/bash

clear

cat << "EOF" 

    ___           _                                  _         _     
   /   \___ _ __ | | ___  _   _ _ __ ___   ___ _ __ | |_   ___| |__  
  / /\ / _ \ '_ \| |/ _ \| | | | '_ ` _ \ / _ \ '_ \| __| / __| '_ \ 
 / /_//  __/ |_) | | (_) | |_| | | | | | |  __/ | | | |_ _\__ \ | | |
/___,' \___| .__/|_|\___/ \__, |_| |_| |_|\___|_| |_|\__(_)___/_| |_|
           |_|            |___/                                      
 _             _                          _                          
| |__  _   _  (_)___ _ __ ___   __ _  ___| |                         
| '_ \| | | | | / __| '_ ` _ \ / _` |/ _ \ |                         
| |_) | |_| | | \__ \ | | | | | (_| |  __/ |                         
|_.__/ \__, | |_|___/_| |_| |_|\__,_|\___|_|                         
       |___/                                                         
 
EOF
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
