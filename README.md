# Infrastructure Windows Server 2022 — Domaine epo.local



Projet académique : déploiement d'une infrastructure Active Directory complète (AD DS, DNS, DHCP, GPO, haute disponibilité) sur VMware Workstation, réalisé dans le cadre de ma formation en ingénierie informatique à l'École Polytechnique de Ouagadougou (EPO).

## Rapport

- [Rapport technique ](docs/rapport-technique.pdf)
## Architecture

![Schéma réseau](docs/images/schema_reseau.png)

| Machine | Rôle | IP | OS |
|---|---|---|---|
| SRV1 (DC1) | Contrôleur de domaine principal, DNS primaire, DHCP | 192.168.10.10 | Windows Server 2022 |
| SRV2 (DC2) | Contrôleur de domaine secondaire, DNS secondaire | 192.168.10.11 | Windows Server 2022 |
| CLIENT1 | Poste client joint au domaine (DHCP) | 192.168.10.100-200 | Windows 10 Pro |

Environnement : VMware Workstation, réseau Host-Only (192.168.10.0/24).

## Structure du dépôt

```
scripts/
  A-ad-dns/          Installation AD DS + promotion du domaine
  B-dns-config/       Zone inverse, MAJ dynamiques, forwarder
  C-dns-records/       Enregistrements A, CNAME, MX
  D-dns-secondaire/     DNS secondaire sur SRV2 + réplication
  E-F-dhcp/         Installation et configuration DHCP (EPO-SCOPE)
  G-test-dhcp/       Tests d'attribution IP sur CLIENT1
  H-I-ou-users/       Unités d'organisation + comptes utilisateurs
  J-gpo/            5 GPO (mot de passe, panneau config, fond écran, USB, réseau)
  K-tests/          Tests DNS, DHCP, GPO
  L-ha/            Tests de haute disponibilité (bascule SRV1 -> SRV2)
  M-securite/        Transfert de zone, verrouillage compte, compte invité
  bonus-iis/         Installation IIS + site intranet.epo.local
docs/
  images/           Schéma réseau et captures
  rapport.md         Rapport technique complet
```

## Résultats clés

- Domaine `epo.local` opérationnel avec réplication AD SRV1 ↔ SRV2 (0 échec)
- DNS : zone principale, zone inverse, forwarder 8.8.8.8, 5 enregistrements
- DHCP : étendue EPO-SCOPE (192.168.10.100-200) avec DNS redondant
- 4 OUs, 3 comptes utilisateurs, 5 GPO appliquées
- Haute disponibilité validée (bascule automatique SRV1 → SRV2)
- Sécurité : transfert de zone restreint, verrouillage de compte, compte invité désactivé

## Auteur

Étudiant en 4ᵉ année génie informatique, spécialisation cybersécurité — École Polytechnique de Ouagadougou (EPO)
