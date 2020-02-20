[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$Uri = 'https://webhook.site/1f748c2c-46de-4747-a2b6-b8914864066a'

Invoke-WebRequest -Body "Initialize compute" -Method 'POST' -Uri $Uri -UseBasicParsing

Import-Module International

Invoke-WebRequest -Body "Set culture to 'pt-BR'" -Method 'POST' -Uri $Uri -UseBasicParsing
Set-Culture 'pt-BR'


# Set auto logon
Invoke-WebRequest -Body "Set auto logon" -Method 'POST' -Uri $Uri -UseBasicParsing
$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
$DefaultUsername = "ccmuser"
$DefaultPassword = "@gd1r3ct@!@!"
Set-ItemProperty $RegPath "AutoAdminLogon" -Value "1" -type String 
Set-ItemProperty $RegPath "DefaultUsername" -Value "$DefaultUsername" -type String 
Set-ItemProperty $RegPath "DefaultPassword" -Value "$DefaultPassword" -type String

# Set Adobe PDF Output Folder.. não rolou
#$RegPath = "HKCU:\Software\Adobe\Acrobat Distiller\10.0\AdobePDFOutputFolder"
#Set-ItemProperty $RegPath "2" -Value "C:\AdobePdfFiles\*.pdf" -type String 

# Restart compute
Invoke-WebRequest -Body "Restart" -Method 'POST' -Uri $Uri -UseBasicParsing
Restart-Computer
