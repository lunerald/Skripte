#!/bin/bash
# bearbeitet alle texDateien

cd /home/arno/Nextcloud/Eigenes/Schule
zi=(`wc -l ./aelist.txt`)

for ((i=0;i<$zi;i++))
do
 read -r wuff
	
if [ -f $wuff ] 

then

 sed -i '/^%/d' $wuff
 sed -i 's/okuyakl.de}/okuyakl.com}/g' $wuff

fi
done < aelist.txt


