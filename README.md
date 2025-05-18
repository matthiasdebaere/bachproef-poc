# bachproef-poc
Deze repository bevat alle benodigde bestanden om de PoC omgeving eenvoudig te reproduceren met behulp van VirtualBox en Vagrant op een Windows toestel.

# Installatie
## Prerequisites
1. Schakel virtualisatie in via UEFI (BIOS).  
2. Schakel Core Isolation uit in Windows Defender.
3. Schakel Hyper-V uit via `bcdedit /set hypervisorlaunchtype off` in powershell.

## VirtualBox    
> ⚠️ **Let op**: Installeer niet de nieuwste versie (7.1), want deze is niet compatibel met Vagrant.
1. Download en installeer [VirtualBox (versie 7.0.20)](https://www.virtualbox.org/wiki/Download_Old_Builds_7_0).

## Vagrant
1. Download en installeer [Vagrant](https://www.vagrantup.com/).
2. Clone de repository `https://github.com/matthiasdebaere/bachproef-poc.git`.
3. Navigeer naar `bachproef-poc/src/` en open een terminal.
4. Voer `vagrant up` uit.

# Post-installatie
## Logingegevens
Standaard logingegevens:
- **Gebruikersnaam:** `vagrant`  
- **Wachtwoord:** `vagrant`  
Eve-NG (webinterface) logingegevens:
- **Gebruikersnaam:** `admin`  
- **Wachtwoord:** `eve`

## Bereikbare diensten
Na het opstarten van de omgeving zijn de volgende services beschikbaar:

| Dienst           | IP-adres       |
|------------------|----------------|
| **Eve-NG**        | http://127.0.0.1:8080  |
| **Ansible AWX**   | http://127.0.0.1:80    |
| **NetBox**        | http://127.0.0.1:8000  |

## Algemeen
1. Zodra alles is opgestart, kan je best eerst inloggen op `http://127.0.0.1:8080` om de gevirtualiseerde netwerkomgeving te starten.  
2. Log vervolgens in op `http://127.0.0.1:80` en voer de gewenste playbooks uit.  
3. De webinterfaces van de firewalls zijn te bereiken via:  
   - **Firewall‑A:** `https://192.168.56.70`  
   - **Firewall‑B:** `https://192.168.56.75`  
