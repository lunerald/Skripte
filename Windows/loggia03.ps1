[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$cookieContainer = New-Object System.Net.CookieContainer
 
$azr = Invoke-WebRequest -Uri 'https://kabel.vodafone.de/meinkabel' -SessionVariable svr
$svr
$azr.Forms.Fields['username']='arnowalter'
$azr.Forms.Fields['password']='B3feK2h5G'
$azr = Invoke-Webrequest -uri $azr.Forms.Action -WebSession $svr -Method post -Body $azr.Forms.Fields 
