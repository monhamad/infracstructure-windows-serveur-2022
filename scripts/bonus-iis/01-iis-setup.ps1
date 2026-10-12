# BONUS : Installation IIS + site intranet.epo.local (SRV1)

Install-WindowsFeature -Name Web-Server -IncludeManagementTools
Get-Service -Name W3SVC
Start-Service -Name W3SVC

# Page d'accueil (voir index.html dans ce dossier)
Copy-Item -Path ".\index.html" -Destination "C:\inetpub\wwwroot\index.html" -Force

Import-Module WebAdministration
New-Website -Name "Intranet-EPO" `
    -PhysicalPath "C:\inetpub\wwwroot" `
    -Port 80 `
    -HostHeader "intranet.epo.local" `
    -Force

# Autoriser le trafic HTTP dans le pare-feu
New-NetFirewallRule -DisplayName "HTTP-IIS" -Direction Inbound -Protocol TCP -LocalPort 80 -Action Allow

# Test depuis CLIENT1 : http://intranet.epo.local
