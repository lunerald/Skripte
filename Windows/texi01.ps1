while("true"){
$lola=Read-host -prompt "Ordner eingeben:" 
$num =($lola).substring($lola.length-3,3)

cd $lola

pdflatex ll$num.tex

cd ..
}