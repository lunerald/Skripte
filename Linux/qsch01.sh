#!/bin/bash

# lädt QR-Codes herunter und setzt sie an Ort und Stelle

read -p "Ordnername: " wau

cd ~/Schule/frischling/$wau

bob=${wau%%[0-9]*}

num=${wau##*L}

case "$bob" in
        m) hugo="math"      
            ;;
        p) hugo="phys"     
            ;;
        c) hugo="chem"       
            ;;
esac

fubb="https://www.qrcode-generator.de/phpqrcode/getCode.php?cht=qr&chl=https%3A%2F%2Fwww.okuyakl.de%2F${hugo}%2F${wau}%2Fll${num}.pdf&chs=180x180&choe=UTF-8&chld=L|0"

#fubb="https://api.qrserver.com/v1/create-qr-code/?data=https%3A%2F%2Fwww.okuyakl.de%2F${hugo}%2F${wau}%2Fll$num.pdf&size=220x220&margin=0"

wget -O qr$num.jpg $fubb

cd ~/Skripte

