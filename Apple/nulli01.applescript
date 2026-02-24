-- sucht freie Nummern für neue Blätter

set nulliFile to "/Users/arnowalter/Nextcloud/Eigenes/Schule/frischling/nulli.txt"
do shell script "rm -f " & nulliFile

display dialog "Wert 1:" default answer ""
set wert1 to text returned of result

display dialog "Wert 2:" default answer ""
set wert2 to text returned of result

set wert1 to (wert1 as integer)
set wert2 to (wert2 as integer)

repeat with nummer from wert1 to wert2
	if nummer < 10 then
		set lauf to "00" & nummer
	else if nummer < 100 then
		set lauf to "0" & nummer
	else
		set lauf to (nummer as string)
	end if
	
	-- Überprüfen, ob das Verzeichnis nicht existiert
	set mazlBackupExists to (do shell script "test -d /Users/arnowalter/Nextcloud/Eigenes/Schule/mazlbackup/*" & lauf & " && echo 1 || echo 0") is "0"
	set physalisExists to (do shell script "test -d /Users/arnowalter/Nextcloud/Eigenes/Schule/physalis/*" & lauf & " && echo 1 || echo 0") is "0"
	set chemisaExists to (do shell script "test -d /Users/arnowalter/Nextcloud/Eigenes/Schule/chemisa/*" & lauf & " && echo 1 || echo 0") is "0"
	
	if mazlBackupExists and physalisExists and chemisaExists then
		do shell script "echo " & lauf & " >> " & nulliFile
	end if
end repeat
