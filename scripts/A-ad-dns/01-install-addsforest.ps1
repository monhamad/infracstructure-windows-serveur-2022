# PARTIE A : Installation AD DS + DNS et promotion du domaine epo.local
# A executer sur SRV1 (PowerShell en administrateur)

# Pre-requis : IP fixe deja configuree (voir docs/rapport.md section "Checklist pre-installation")
# Exemple : netsh interface ip set address "Ethernet0" static 192.168.10.10 255.255.255.0 192.168.10.1
#           netsh interface ip set dns "Ethernet0" static 192.168.10.10

# 1. Installer les roles AD DS et DNS
Install-WindowsFeature -Name AD-Domain-Services, DNS -IncludeManagementTools

# 2. Promouvoir le serveur en controleur de domaine (nouvelle foret)
Install-ADDSForest -DomainName "epo.local"
# -> Renseigner un mot de passe DSRM fort
# -> Confirmer avec O
# -> Le serveur redemarre automatiquement
