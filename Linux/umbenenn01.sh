#!/bin/bash
read -p "Alter Ordnername: " alt

bob=${alt%%[0-9]*}

	case "$bob" in
       		m) hugo="math" 
	   	   miau="mazlbackup"
            ;;
        	p) hugo="phys" 
           	   miau="physalis"
            
	    ;;
        	ch) hugo="chem"  
           	   miau="chemisa"
            ;;
	esac

if [ ! -d ~/Schule/$miau/$alt ]
      then	
        echo "Ordner existiert nicht"
	exit 
fi

read -p "neuer Ordnername: " neu

mv ~/Schule/$miau/$alt ~/Schule/$miau/$neu
mv ~/Dropbox/Schule/$miau/$alt ~/Dropbox/Schule/$miau/$neu
mv ~/Dropbox/htmls/$hugo/$alt ~/Dropbox/htmls/$hugo/$neu
mv  /opt/lampp/htdocs/$hugo/$alt /opt/lampp/htdocs/$hugo/$neu

