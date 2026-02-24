#!/bin/bash
# lädt QR-Codes und integriert sie in Dokumente

read -p "Nummer: " wau

cd ~/Schule/mazlbackup


ord=`find ./ -name "*$wau" -type d` 


echo ${ord#./}

cd $ord

fubb="https://www.qrcode-generator.de/phpqrcode/getCode.php?cht=qr&chl=https%3A%2F%2Fwww.okuyakl.de%2Fmath%2F${ord#./}%2Fll${wau}.pdf&chs=180x180&choe=UTF-8&chld=L|0"


wget -O qr${wau}.png $fubb

rm qr$wau.jpg

pdflatex aa$wau.tex

read -p "Weiter  j/n ?" hae

if [ $hae=="j" ]
then

cp aa${wau}.pdf /run/user/1000/gvfs/ftp:host=host90.checkdomain.de/htdocs/math/${ord#./}/
fi



