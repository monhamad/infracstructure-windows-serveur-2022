# PARTIE E : Installation DHCP (SRV1)

Install-WindowsFeature -Name DHCP -IncludeManagementTools

# Autoriser le serveur DHCP dans Active Directory
Add-DhcpServerInDC -DnsName "SRV1.epo.local" -IPAddress 192.168.10.10
Get-DhcpServerInDC


# PARTIE F : Configuration de l'etendue EPO-SCOPE

Add-DhcpServerv4Scope -Name "EPO-SCOPE" `
    -StartRange 192.168.10.100 `
    -EndRange 192.168.10.200 `
    -SubnetMask 255.255.255.0 `
    -State Active

Set-DhcpServerv4OptionValue -ScopeId 192.168.10.0 -Router 192.168.10.1

Set-DhcpServerv4OptionValue -ScopeId 192.168.10.0 `
    -DnsServer 192.168.10.10, 192.168.10.11 `
    -DnsDomain "epo.local"

# Verifications
Get-DhcpServerv4Scope
Get-DhcpServerv4OptionValue -ScopeId 192.168.10.0
