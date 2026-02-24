#Nützliche Befehle:

# listet das Änderungsdatum auf

ls -l  | awk '{ print $6, $7, $8, $9}'


# Textdatei in Array schreiben - noch nicht getestet
function ordli {
i=0
while IFS = $'\n' read -r wuff
	do
	ord[i]="${wuff}"
	((i++))
	done < filename.txt
}

function seib {
i=0
while ((${ord[@]} > $i )) 
	do
	echo "$ord[i++]\n"
	done
}
