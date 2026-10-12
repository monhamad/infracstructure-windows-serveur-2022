# PARTIE B : Configuration DNS (SRV1)

# 1. Verifier la zone epo.local
Get-DnsServerZone

# 2. Creer la zone inverse (192.168.10.0/24)
Add-DnsServerPrimaryZone -NetworkID "192.168.10.0/24" -ReplicationScope "Forest"

# 3. Activer les mises a jour dynamiques securisees
Set-DnsServerPrimaryZone -Name "epo.local" -DynamicUpdate "Secure"

# 4. Configurer le forwarder vers Google DNS
Add-DnsServerForwarder -IPAddress "8.8.8.8"

# Verifications
Get-DnsServerZone -Name "epo.local" | Select-Object ZoneName, DynamicUpdate
Get-DnsServerForwarder
