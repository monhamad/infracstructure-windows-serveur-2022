# PARTIE G : Test DHCP (CLIENT1)

Set-NetIPInterface -InterfaceAlias "Ethernet0" -Dhcp Enabled

ipconfig /release
ipconfig /renew

ipconfig /all
# Resultat attendu :
#   Adresse IP    : 192.168.10.100-200
#   Passerelle    : 192.168.10.1
#   Serveur DHCP  : 192.168.10.10
#   DNS           : 192.168.10.10, 192.168.10.11
#   Suffixe DNS   : epo.local
