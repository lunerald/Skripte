#!/bin/bash
# kopiert alle html- und php-Dateien nach Dropbox und checkdomain

cd /opt/lampp/htdocs
zi=(`wc -l /opt/lampp/htdocs/welle01.txt`)

for ((i=0;i<$zi;i++))
do
 read -r wuff
	
	
cp $wuff ~/Dropbox/htmls/$wuff

cp $wuff /run/user/1000/gvfs/ftp:host=host90.checkdomain.de,user=jawriowu/htdocs/$wuff

done < /opt/lampp/htdocs/welle01.txt


