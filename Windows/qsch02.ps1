# lädt QR-Codes herunter und setzt sie an Ort und Stelle
# Weiterentwicklung zu qsch01

cd \\192.168.178.1\fritz.nas\SD\Schule\frischling\

$lola=Read-Host -Prompt "Ordner eingeben"

# bearbeitet Strings zur Weiterverarbeitung


$lisa=($lola).substring(0,1)

switch ($lisa){
 m {$hugo="math"}
 p {$hugo="phys"}
 c {$hugo="chem"}
}
$num =($lola).substring($lola.length-3,3)

$sami = "https://api.qrserver.com/v1/create-qr-code/?data=https%3A%2F%2Fwww.okuyakl.de%2F"+$hugo+"%2F"+$lola+"%2Fll$num.pdf&size=220x220&margin=0"

cd $lola

Invoke-WebRequest -Uri $sami -outfile qr$num.png 


cd..

