# PARTIE L : Haute disponibilite
# 1. Eteindre SRV1 dans VMware (clic droit -> Power -> Shut Down Guest)

# 2. Depuis SRV2 : verifier que le domaine repond toujours
nslookup intranet.epo.local 192.168.10.11
nslookup moodle.epo.local 192.168.10.11
ping epo.local
netdom query fsmo

# 3. Depuis CLIENT1 : verifier la bascule automatique vers le DNS secondaire
ipconfig /all
nslookup intranet.epo.local
nltest /dsgetdc:epo.local

# 4. Ne pas oublier de rallumer SRV1 apres les tests
