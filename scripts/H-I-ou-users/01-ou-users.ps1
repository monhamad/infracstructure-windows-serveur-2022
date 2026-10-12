# PARTIE H : Unites d'organisation (SRV1)

New-ADOrganizationalUnit -Name "Admin"       -Path "DC=epo,DC=local"
New-ADOrganizationalUnit -Name "Enseignants" -Path "DC=epo,DC=local"
New-ADOrganizationalUnit -Name "Etudiants"   -Path "DC=epo,DC=local"
New-ADOrganizationalUnit -Name "Serveurs"    -Path "DC=epo,DC=local"

Get-ADOrganizationalUnit -Filter * | Select-Object Name, DistinguishedName


# PARTIE I : Comptes utilisateurs
# NOTE : remplacer le mot de passe par defaut avant toute utilisation reelle

$defaultPassword = ConvertTo-SecureString "ChangeMe@2026" -AsPlainText -Force

New-ADUser -Name "admin1" -GivenName "Admin" -Surname "Un" -SamAccountName "admin1" `
    -Path "OU=Admin,DC=epo,DC=local" -AccountPassword $defaultPassword -Enabled $true

New-ADUser -Name "prof1" -GivenName "Prof" -Surname "Un" -SamAccountName "prof1" `
    -Path "OU=Enseignants,DC=epo,DC=local" -AccountPassword $defaultPassword -Enabled $true

New-ADUser -Name "etu1" -GivenName "Etu" -Surname "Un" -SamAccountName "etu1" `
    -Path "OU=Etudiants,DC=epo,DC=local" -AccountPassword $defaultPassword -Enabled $true

Get-ADUser -Filter * | Select-Object Name, DistinguishedName
