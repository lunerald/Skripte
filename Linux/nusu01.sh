#!/bin/bash

# sucht freie Nummern für neue Blätter

rm ~/Nextcloud/Eigenes/Schule/frischling/nulli.txt
read -p "Wert 1:" wert1
read -p "Wert 2:" wert2
 
for ((nummer= $wert1;nummer<=$wert2; nummer++))
	do
	
	if [ $nummer -lt 10 ] 
	then
	   lauf="00${nummer}"
	  elif [ $nummer -lt 100 ]
		then
	   	  lauf="0${nummer}"
		else
	   lauf="${nummer}"
	  fi

	if [ ! -d ~/Nextcloud/Eigenes/Schule/mazlbackup/*${lauf} ] && [ ! -d ~/Nextcloud/Eigenes/Schule/physalis/*${lauf} ] && [ ! -d ~/Nextcloud/Eigenes/Schule/chemisa/*${lauf} ]
	then
	  echo ${lauf} >> ~/Nextcloud/Eigenes/Schule/frischling/nulli.txt
	fi
done
