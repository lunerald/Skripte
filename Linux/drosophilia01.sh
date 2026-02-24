#!/bin/bash
# Backupskript zum Sichern von home/arno/Dropbox nach home/arno

echo "Zeit in Tagen ?"
read tag 

find ~/Dropbox -path "*/.*" -prune -o  -name "*" -type d -mtime -$tag -print > origa.txt

find ~/Dropbox -path "*/.*" -prune -o  -name "*.*" -type f -mtime -$tag -print > fili.txt

cp fili.txt zili.txt

# filtern

sed -i 's!/home/arno/Dropbox!mkdir -p /home/arno!' origa.txt

sed -i 's!/home/arno/Dropbox!cp /home/arno/Dropbox!' fili.txt 

sed -i 's!/Dropbox!/.!' zili.txt 

#erstellen von Skript
echo '#!/bin/bash' > poisson.sh

cat origa.txt >> poisson.sh
chmod a+x poisson.sh

paste  fili.txt zili.txt >> poisson.sh

rm fili.txt
rm zili.txt
rm origa.txt


