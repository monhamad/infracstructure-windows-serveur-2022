# PARTIE D : DNS secondaire et second controleur de domaine (SRV2)

# Pre-requis sur SRV2 : IP fixe 192.168.10.11, DNS pointant vers SRV1 (192.168.10.10)

# 1. Installer le role AD DS (necessaire avant Install-ADDSDomainController)
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# 2. Installer le role DNS
Install-WindowsFeature -Name DNS -IncludeManagementTools

# 3. Joindre le domaine epo.local
Add-Computer -DomainName "epo.local" -Credential (Get-Credential) -Restart
# -> Utilisateur : EPO\Administrateur

# 4. Apres redemarrage : promouvoir SRV2 en second controleur de domaine
Install-ADDSDomainController -DomainName "epo.local" -Credential (Get-Credential)
# -> Utilisateur : EPO\Administrateur (format domaine\utilisateur obligatoire)

# 5. Verifier la replication (depuis SRV1 ou SRV2)
repadmin /replsummary
