#!/bin/bash
# bearbeitet alle php-Dateien

cd /opt/lampp/htdocs
zi=(`wc -l /opt/lampp/htdocs/welle01.txt`)

for ((i=0;i<$zi;i++))
do
 read -r wuff
	
	
sed -i s/d44diFMT/dD%%ff44/g $wuff

done < /opt/lampp/htdocs/welle01.txt


