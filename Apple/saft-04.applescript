set sourceFolderName to text returned of (display dialog "Bitte den Namen des Ordners eingeben:" default answer "")

-- Ersten Buchstaben extrahieren
set firstLetter to character 1 of sourceFolderName

-- Ordnernamen prŸfen und Variablen zuweisen
if firstLetter is "m" then
	set pf1 to "math/"
	set pf2 to "mazlbackup/"
	
else if firstLetter is "p" then
	set pf1 to "phys/"
	set pf2 to "physalis/"
	
else if firstLetter is "c" then
	set pf1 to "chem/"
	set pf2 to "chemisa/"
	
else
	display dialog "Name ungŸltig"
	return
end if

set nummer to text -3 thru -1 of sourceFolderName


-- Pfade definieren
set fullsourcePath1 to "/Volumes/FRITZ.NAS/SD/Schule/" & pf2 & sourceFolderName & "/"
set fulldestPath1 to "/Users/arnowalter/Nextcloud/Eigenes/htmls/Schule/" & pf1 & sourceFolderName & "/"
set fulldestPath2 to "/Users/arnowalter/Nextcloud/Eigenes/Schule/" & pf2 & sourceFolderName & "/"
set fulldestPath3 to "/Volumes/FRITZ.NAS/SD/htmls/Schule/" & pf1 & sourceFolderName & "/"

-- Pfade zu POSIX konvertieren
set sourcePath to POSIX path of fullsourcePath1
set destPath1 to POSIX path of fulldestPath1
set destPath2 to POSIX path of fulldestPath2
set destPath3 to POSIX path of fulldestPath3

-- ExistenzprŸfung fŸr Quellordner
if (do shell script "test -d " & quoted form of sourcePath & " && echo 'exists' || echo 'missing'") = "exists" then
	try
		-- Liste der Dateimuster
		set filePatterns to {"aa" & nummer & ".pdf", "ll" & nummer & ".pdf", "ae" & nummer & ".pdf", "le" & nummer & ".pdf"}
		
		-- Schleife durch Dateimuster mit ExistenzprŸfung
		repeat with pattern in filePatterns
			display dialog quoted form of (sourcePath & pattern)
			if (do shell script "ls " & quoted form of (sourcePath & pattern) & " 2>/dev/null || echo 'missing'") is not "missing" then
				-- Dateien kopieren
				do shell script "cp -f " & quoted form of (sourcePath & pattern) & " " & quoted form of destPath1
				do shell script "cp -f " & quoted form of (sourcePath & pattern) & " " & quoted form of destPath3
			else
				display dialog "Dateimuster '" & pattern & "' wurde im Quellordner nicht gefunden."
			end if
		end repeat
		
		-- Gesamten Quellordner in das zweite Zielverzeichnis kopieren
		do shell script "cp -Rf " & quoted form of sourcePath & " " & quoted form of destPath2
		
		-- Erfolgsmeldung
		display dialog "Dateien erfolgreich kopiert!"
		
	on error errMsg
		display dialog "Fehler beim Kopieren: " & errMsg
	end try
else
	display dialog "Der Ordner '" & sourceFolderName & "' existiert nicht!"
end if
