#!/bin/bash

# lädt QR-Codes für Abi herunter und setzt sie an Ort und Stelle

read -p "Abi? " wau

mkdir -p ~/Schule/abimath/JG$wau
mv ~/Schule/abimath/abi$wau.pdf ~/Schule/abimath/JG$wau/abi$wau.pdf

cd ~/Schule/abimath/JG$wau

read -p "Seitenzahl? " zik


for ((z=2;z<=zik;z++))
do
fubb="https://www.qrcode-generator.de/phpqrcode/getCode.php?cht=qr&chl=https%3A%2F%2Fwww.okuyakl.de%2Fabimath%2FJG${wau}%2Fll${wau}_s${z}.pdf&chs=180x180&choe=UTF-8&chld=L|0"


wget -O qr${wau}_${z}.jpg $fubb

sleep 2

done

cd ~/Skripte

