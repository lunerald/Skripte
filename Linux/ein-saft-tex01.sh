#!/bin/bash
# speichert tex dateien in die richtigen Ordner auf home/arno ab

# ACHTUNG Änderungsreihenfolge Nextcloud -> SD 

read -p "Ordnername: " wau

bob=${wau%%[0-9]*}

num=${wau: -3}

case "$bob" in
        m)  hugo1="math"
            hugo2="mazlbackup"      
            ;;
        p) hugo1="phys"  
          hugo2="physalis"  
            ;;  
        ch) hugo1="chem"  
            hugo2="chemisa"    
            ;;
esac
echo $num

mkdir -p ~/Nextcloud/Eigenes/htmls/Schule/$hugo1/$wau
cd ~/Nextcloud/Eigenes/htmls/Schule/$hugo1/$wau

cp ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/aa$num.pdf .
cp ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/ae$num.pdf .
cp ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/ll$num.pdf .
cp ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/le$num.pdf .

mkdir -p /run/user/1000/gvfs/smb-share:server=fritz.box,share=fritz.nas/SD/htmls/Schule/$hugo1/$wau
cd /run/user/1000/gvfs/smb-share:server=fritz.box,share=fritz.nas/SD/htmls/Schule/$hugo1/$wau

cp ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/aa$num.pdf .
cp ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/ae$num.pdf .
cp ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/ll$num.pdf .
cp ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/le$num.pdf .

mkdir -p /run/user/1000/gvfs/smb-share:server=fritz.box,share=fritz.nas/SD/Schule/$hugo2/$wau
cd /run/user/1000/gvfs/smb-share:server=fritz.box,share=fritz.nas/SD/Schule/$hugo2

cp -r ~/Nextcloud/Eigenes/Schule/$hugo2/$wau .

cd 
