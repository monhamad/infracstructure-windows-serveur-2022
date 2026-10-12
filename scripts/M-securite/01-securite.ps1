# PARTIE M : Securite (SRV1)

# 1. Restreindre le transfert de zone DNS a SRV2 uniquement
Set-DnsServerPrimaryZone -Name "epo.local" `
    -SecureSecondaries TransferToSecureServers `
    -SecondaryServers 192.168.10.11

Get-DnsServerPrimaryZone -Name "epo.local" | Select-Object SecureSecondaries, SecondaryServers

# 2. Verrouillage de compte apres 5 echecs
Set-ADDefaultDomainPasswordPolicy -Identity "epo.local" `
    -LockoutThreshold 5 `
    -LockoutDuration 00:30:00 `
    -LockoutObservationWindow 00:30:00

Get-ADDefaultDomainPasswordPolicy | Select-Object LockoutThreshold, LockoutDuration, LockoutObservationWindow

# 3. Desactiver le compte invite
Disable-ADAccount -Identity "Invité"
Get-ADUser -Identity "Invité" | Select-Object Name, Enabled
