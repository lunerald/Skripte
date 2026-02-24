#!/bin/bash
cd ~/Schule
zi=(`wc -l ~/Schule/llist%2F.txt`)

cd QRcodes

for ((i=0;i<$zi;i++))
do
 read -r wuff

fubb="https://www.qrcode-generator.de/phpqrcode/getCode.php?cht=qr&chl=https%3A%2F%2Fwww.okuyakl.de%2F${wuff}&chs=180x180&choe=UTF-8&chld=L|0"


wget -O qr${i}.jpg $fubb

sleep 2

done < ~/Schule/llist%2F.txt
