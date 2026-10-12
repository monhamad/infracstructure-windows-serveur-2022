# PARTIE J : Strategies de groupe (SRV1)

# GPO 1 - Politique de mot de passe (domaine entier)
Set-ADDefaultDomainPasswordPolicy -Identity "epo.local" `
    -MinPasswordLength 8 `
    -ComplexityEnabled $true `
    -MaxPasswordAge 30.00:00:00

# GPO 2 - Bloquer le panneau de configuration (OU Etudiants)
New-GPO -Name "Bloquer-PanneauConfig" | New-GPLink -Target "OU=Etudiants,DC=epo,DC=local"
Set-GPRegistryValue -Name "Bloquer-PanneauConfig" `
    -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" `
    -ValueName "NoControlPanel" -Type DWord -Value 1

# GPO 3 - Fond d'ecran impose (OU Enseignants)
New-GPO -Name "FondEcran-Enseignants" | New-GPLink -Target "OU=Enseignants,DC=epo,DC=local"
Set-GPRegistryValue -Name "FondEcran-Enseignants" `
    -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" `
    -ValueName "Wallpaper" -Type String -Value "C:\Windows\Web\Wallpaper\Windows\img0.jpg"

# GPO 4 - Desactiver l'acces USB (OU Etudiants)
New-GPO -Name "Bloquer-USB" | New-GPLink -Target "OU=Etudiants,DC=epo,DC=local"
Set-GPRegistryValue -Name "Bloquer-USB" `
    -Key "HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR" `
    -ValueName "Start" -Type DWord -Value 4

# GPO 5 - Parametres reseau / client DHCP (OU Etudiants + Enseignants)
New-GPO -Name "Parametres-Reseau" | New-GPLink -Target "OU=Etudiants,DC=epo,DC=local"
New-GPLink -Name "Parametres-Reseau" -Target "OU=Enseignants,DC=epo,DC=local"

# Verification
Get-GPO -All | Select-Object DisplayName, GpoStatus
