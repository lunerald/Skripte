# lädt QR-Codes herunter und setzt sie an Ort und Stelle
# Weiterentwicklung zu qsch01
while("true"){

cd \\192.168.178.1\fritz.nas\SD\Schule\

$lola=Read-Host -Prompt "Ordner eingeben"
if($lola -eq "x"){exit}

# bearbeitet Strings zur Weiterverarbeitung


$lisa=($lola).substring(0,1)

switch ($lisa){
 m {$hugo1="mazlbackup"; $hugo="math"}
 p {$hugo1="physalis"; $hugo="phys"}
 c {$hugo1="chemisa"; $hugo="chem"}
}
$num =($lola).substring($lola.length-3,3)

$sami = "https://api.qrserver.com/v1/create-qr-code/?data=https%3A%2F%2Fwww.okuyakl.de%2F"+$hugo+"%2F"+$lola+"%2Fle$num.pdf&size=220x220&margin=0"

cd $hugo1\$lola

Invoke-WebRequest -Uri $sami -outfile qre$num.png 

if(! (test-path ae$num.tex)){
New-Item ae$num.tex
New-Item le$num.tex}

cd..
}

