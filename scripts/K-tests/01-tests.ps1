# PARTIE K : Tests (DC1 et CLIENT1)

# Tests DNS
nslookup intranet.epo.local
nslookup moodle.epo.local
nslookup mail.epo.local
nslookup www.epo.local

# Tests GPO
gpupdate /force
gpresult /r
gpresult /r /scope computer   # pour voir les GPO "configuration ordinateur" (Bloquer-USB, Parametres-Reseau)

# Tests CLIENT1
ipconfig /all
ping intranet.epo.local
ping moodle.epo.local
