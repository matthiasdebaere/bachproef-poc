# bachproef-poc
Deze repository bevat alle benodigde bestanden om de PoC omgeving eenvoudig te reproduceren met behulp van VirtualBox en Vagrant op een Windows toestel.

# Installatie

## Prerequisites
1. Schakel virtualisatie in via UEFI (BIOS).  
2. Schakel Core Isolation uit in Windows Defender.
3. Schakel Hyper-V uit via `bcdedit /set hypervisorlaunchtype off` in powershell.

## VirtualBox    
> [!Warning]
> Installeer niet de nieuwste versie (7.1), want deze is niet compatibel met Vagrant.

1. Download en installeer [VirtualBox (versie 7.0.20)](https://www.virtualbox.org/wiki/Download_Old_Builds_7_0).
2. Configureer de VirtualBox Host-Only Ethernet Adapter zoals in de onderstaande screenshot.
![network_adapter](img/network_adapters.png)

## Vagrant
1. Download en installeer [Vagrant](https://www.vagrantup.com/).

## Git
1. Download en installeer [Git](https://git-scm.com/downloads).
2. Clone de repository `https://github.com/matthiasdebaere/bachproef-poc.git`.
3. Navigeer naar `bachproef-poc/src/` en voer `install.ps1` uit.

# Post-installatie
## Logingegevens
Ansible-AWX (webinterface) logingegevens:
- **Gebruikersnaam:** `vagrant`  
- **Wachtwoord:** `vagrant`

NetBox (webinterface) logingegevens:
- **Gebruikersnaam:** `vagrant`  
- **Wachtwoord:** `vagrant`  

Eve-NG (webinterface) logingegevens:
- **Gebruikersnaam:** `admin`  
- **Wachtwoord:** `eve`

firewall logingegevens:
- **Gebruikersnaam:** `vagrant`  
- **Wachtwoord:** `vagrant`

switch logingegevens:
- **Gebruikersnaam:** `admin`  
- **Wachtwoord:** `admin`

## Bereikbare diensten
Na het opstarten van de omgeving zijn de volgende services beschikbaar:

| Dienst           | IP-adres       |
|------------------|----------------|
| **Eve-NG**        | http://127.0.0.1:8080 |
| **Ansible AWX**   | http://127.0.0.1:80 of http://192.168.56.60:31362 |
| **NetBox**        | http://127.0.0.1:8000 of http://192.168.56.65:8000 |


1. Log eerst in op **Eve-NG** (usr: `admin`, pwd: `eve` en selecteer `Html5 console`) om de gevirtualiseerde netwerkomgeving op te starten.
2. Log vervolgens in op **Ansible AWX** en voer de gewenste playbooks uit.
3. De webinterfaces van de firewalls zijn bereikbaar op:
   - **Firewall‑A:** `https://192.168.56.70`
   - **Firewall‑B:** `https://192.168.56.75`
4. Voor de switches open je best een nieuw consolevenster vanuit Eve-NG (op voorwaarde dat je met de `Html5 console` hebt ingelogd).
