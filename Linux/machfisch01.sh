#!/bin/bash
# Backupskript zum Sichern von home/arno nach usb-Stick

read -p "Zeit in Tagen: " wau

find ~/ -path "*/.*" -prune -o  -name "*" -type d -mtime -$wau -print > origa.txt

find ~/ -path "*/.*" -prune -o  -name "*.*" -type f -mtime -$wau -print > fili.txt

# filtern
sed -i '/Dropbox/d' origa.txt
sed -i '/chem/d' origa.txt
sed -i '/math/d' origa.txt
sed -i '/phys/d' origa.txt


sed -i '/Dropbox/d' fili.txt
sed -i '/chem/d' fili.txt
sed -i '/math/d' fili.txt
sed -i '/phys/d' fili.txt

cp fili.txt zili.txt

sed -i 's!/home/arno!mkdir -p /media/arno/00ACC5344AB52482!' origa.txt

sed -i 's!/home!cp /home!' fili.txt 

sed -i 's!/home/arno!/media/arno/00ACC5344AB52482!' zili.txt 

#erstellen von Skript
echo '#!/bin/bash' > poisson.sh

cat origa.txt >> poisson.sh
chmod a+x poisson.sh

paste  fili.txt zili.txt >> poisson.sh

rm fili.txt
rm zili.txt
rm origa.txt


