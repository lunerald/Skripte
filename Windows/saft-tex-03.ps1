# Set-ExecutionPolicy RemoteSigned

while("true"){

$freu=Read-Host -Prompt "Ordner eingeben"

    switch (($freu).substring(0,1)){
 m {$hugo="math"
    $marc="mazlbackup"}
 p {$hugo="phys"
    $marc="physalis"}
 c {$hugo="chem"
    $marc="chemisa"}
 x {exit}
    }

if(test-path \\192.168.178.1\fritz.nas\SD\Schule\$marc\$freu){
   
    # erstellt Ordner auf externer Festplatte htmls
    $holl="\\192.168.178.1\fritz.nas\SD\htmls\Schule\"+$hugo+"\"+$freu
    If(!(test-path $holl)){
    New-Item -Path $holl -ItemType directory
    }

    # erstellt Ordner in Nextcloud Quell
    $doll="C:\Users\aw394\Nextcloud\Eigenes\Schule\"+$marc+"\"+$freu
    If(!(test-path $doll)){
    New-Item -Path $doll -ItemType directory
    }

    # erstellt Ordner in Nextcloud/web
    $woll="C:\Users\aw394\Nextcloud\Eigenes\htmls\Schule\"+$hugo+"\"+$freu
    If(!(test-path $woll)){
    New-Item -Path $woll -ItemType directory
    }


    cd \\192.168.178.1\fritz.nas\SD\Schule\$marc\$freu

    $fritz=Get-ChildItem 

    foreach ($anni in $fritz){
        $wau=($anni.PSPath).split("\")

        #kopiert in Nextcloud Quell
        $diel="C:\Users\aw394\Nextcloud\Eigenes\Schule\"+$marc+"\"+$freu+"\"+$wau[$wau.length-1]
        Copy-Item -Path $anni.PSPath -Destination $diel


        
        if(($wau[$wau.length-1].StartsWith("aa") -or 
            $wau[$wau.length-1].StartsWith("ll") -or 
            $wau[$wau.length-1].StartsWith("ae") -or 
            $wau[$wau.length-1].StartsWith("le")) -and $wau[$wau.length-1].EndsWith(".pdf")){

            #kopiert in Nextcloud/htmls
            $wiel="C:\Users\aw394\Nextcloud\Eigenes\htmls\Schule\"+$hugo+"\"+$freu+"\"+$wau[$wau.length-1]
            Copy-Item -Path $anni.PSPath -Destination $wiel
            
            #kopiert in SD/htmls
            $wied="\\192.168.178.1\fritz.nas\SD\htmls\Schule\"+$hugo+"\"+$freu+"\"+$wau[$wau.length-1]
            Copy-Item -Path $anni.PSPath -Destination $wied

        }

    
}
cd C:\Users\aw394\Nextcloud\Eigenes\Schule
}else{
echo "Ordner existiert nicht"}
}