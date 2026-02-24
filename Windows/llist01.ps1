# Erstellt Liste mit ll-Dateien
cd C:\Users\aw394\Dropbox\mazlbackup
$emil="math"

$kik = Get-ChildItem -Filter aa*.pdf -name -recurse 

# bearbeitet Strings zur Weiterverarbeitung

for ($i=0; $i -lt $kik.Length; $i++){ 

$egon=($kik.Item($i)).replace( "\", "%2F")
$hugo= $egon -split "%2Faa"
$num =($hugo[1]).substring(0,3)

if($num -ne 181 -and $num -ne 088 -and $num -ne 024 -and $num -ne 027){


cd $hugo[0]

Invoke-WebRequest -Uri "https://api.qrserver.com/v1/create-qr-code/?data=https%3A%2F%2Fwww.okuyakl.de%2F$emil%2F$egon&size=220x220&margin=0" -outfile qr$num.png 

rm qr*.jpg 

pdflatex aa$num.tex



$pfad="C:\Users\aw394\Dropbox\web\"+$emil+"\"+$hugo[0]+"\aa"+$num+".pdf"

Copy-Item aa$num.pdf -Destination $pfad -force 
cd..
}
}