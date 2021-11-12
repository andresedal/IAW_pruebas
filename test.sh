#!/bin/bash
clear
echo "Di algo"
read prueba

if [ 3 -gt $prueba ]; then
    echo "true"
    # ip a
elif [ 3 -lt $prueba ]; then
    echo "false"
    # users
else
    echo "igual"
    # cat /etc/passwd
    fechaahora=$(date)
    echo $fechaahora
fi