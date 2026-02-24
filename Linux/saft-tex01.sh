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

if [ -d ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/aa$num.pdf ]
then
cp -v ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/aa$num.pdf ~/Nextcloud/Eigenes/htmls/Schule/$hugo1/$wau
fi 

if [ -d  ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/ae$num.pdf ]
then
cp -v ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/ae$num.pdf ~/Nextcloud/Eigenes/htmls/Schule/$hugo1/$wau
fi 
if [ -d ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/ll$num.pdf ]
then
cp -v ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/ll$num.pdf ~/Nextcloud/Eigenes/htmls/Schule/$hugo1/$wau
fi
if [ -d ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/le$num.pdf ]
then
cp -v ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/le$num.pdf ~/Nextcloud/Eigenes/htmls/Schule/$hugo1/$wau
fi 

mkdir -p /run/user/1000/gvfs/smb-share:server=fritz.box,share=fritz.nas/SD/htmls/Schule/$hugo1/$wau

if [ -d ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/aa$num.pdf ]
then
cp -v ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/aa$num.pdf /run/user/1000/gvfs/smb-share:server=fritz.box,share=fritz.nas/SD/htmls/Schule/$hugo1/$wau
fi
if [ -d ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/ae$num.pdf ]
then
cp -v ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/ae$num.pdf /run/user/1000/gvfs/smb-share:server=fritz.box,share=fritz.nas/SD/htmls/Schule/$hugo1/$wau
fi
if [ -d ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/ll$num.pdf ]
then
cp -v ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/ll$num.pdf /run/user/1000/gvfs/smb-share:server=fritz.box,share=fritz.nas/SD/htmls/Schule/$hugo1/$wau
fi
if [ -d ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/le$num.pdf ]
then 
cp -v ~/Nextcloud/Eigenes/Schule/$hugo2/$wau/le$num.pdf /run/user/1000/gvfs/smb-share:server=fritz.box,share=fritz.nas/SD/htmls/Schule/$hugo1/$wau
fi

mkdir -p /run/user/1000/gvfs/smb-share:server=fritz.box,share=fritz.nas/SD/Schule/$hugo2/$wau

if [ -d ~/Nextcloud/Eigenes/Schule/$hugo2/$wau ]
then
cp -rv ~/Nextcloud/Eigenes/Schule/$hugo2/$wau /run/user/1000/gvfs/smb-share:server=fritz.box,share=fritz.nas/SD/Schule/$hugo2
fi

