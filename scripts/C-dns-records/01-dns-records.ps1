# PARTIE C : Enregistrements DNS (SRV1)

# Enregistrements A
Add-DnsServerResourceRecordA -Name "intranet" -ZoneName "epo.local" -IPv4Address "192.168.10.20"
Add-DnsServerResourceRecordA -Name "moodle"   -ZoneName "epo.local" -IPv4Address "192.168.10.30"
Add-DnsServerResourceRecordA -Name "mail"     -ZoneName "epo.local" -IPv4Address "192.168.10.40"

# CNAME www -> intranet
Add-DnsServerResourceRecordCName -Name "www" -ZoneName "epo.local" -HostNameAlias "intranet.epo.local"

# Enregistrement MX
Add-DnsServerResourceRecordMX -Name "." -ZoneName "epo.local" -MailExchange "mail.epo.local" -Preference 10

# Verification
Get-DnsServerResourceRecord -ZoneName "epo.local"
