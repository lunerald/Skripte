#!/bin/bash
# speichert in die richtigen Ordner auf home/arno ab

# ACHTUNG Änderungsreihenfolge Nextcloud -> SD  
cd /home/arno
zi=(`wc -l < ./lelist.txt`)


for ((i=0;i<$zi;i++))
do
IFS='/' read -r -a pfadel 

dummy=${pfadel[7]}
bob=${dummy%%[0-9]*}

echo $dummy
echo "$bob"

case "$bob" in
        m) hugo="math"      
            ;;
        p) hugo="phys"     
            ;;
        ch) hugo="chem"       
            ;;
esac
echo $hugo

cd ~/${pfadel[3]}/${pfadel[4]}/${pfadel[5]}/${pfadel[6]}/${pfadel[7]}/
cp  ${pfadel[8]}  ~/Nextcloud/Eigenes/htmls/Schule/$hugo/${pfadel[7]}/


read -p "Press Enter to continue or 'q' to quit: " input < /dev/tty
if [[ $input == 'q' ]]; then
break
fi

done < lelist.txt
