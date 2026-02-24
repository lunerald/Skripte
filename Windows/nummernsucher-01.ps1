if(test-path \\192.168.178.1\fritz.nas\SD\Schule\frischling\nulli.txt){

Remove-Item \\192.168.178.1\fritz.nas\SD\Schule\frischling\nulli.txt}

$unter=Read-Host -Prompt "Untere Grenze"
[int]$iunter =[convert]::ToInt32($unter,10)
$ober=Read-Host -Prompt "Obere Grenze"
[int]$iober =[convert]::ToInt32($ober,10)



for ($nummer = $iunter; $nummer -le $iober; $nummer++){

if($nummer -lt 10){ $lauf="00$nummer"
   
    }elseif($nummer -lt 100){ $lauf="0$nummer"

        }else{ $lauf=$nummer}

if(!(test-path \\192.168.178.1\fritz.nas\SD\Schule\mazlbackup\*$lauf )-and !(test-path \\192.168.178.1\fritz.nas\SD\Schule\physalis\*$lauf )-and !(test-path \\192.168.178.1\fritz.nas\SD\Schule\chemisa\*$lauf )){

Write-host $lauf}
}
