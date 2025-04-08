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
> ⚠️ **Let op**: De Vagrant boxes staan in een privérepository op HashiCorp. Je hebt daarom een account nodig en moet expliciet toegang krijgen tot mijn repository voordat je ze kunt gebruiken in de volgende stap.
1. Maak een account op [HashiCorp Cloud Platform](https://portal.cloud.hashicorp.com/sign-up).
2. Download en installeer [Vagrant](https://www.vagrantup.com/).
3. Clone de repository `https://github.com/matthiasdebaere/bachproef-poc.git`.
4. Navigeer naar `bachproef-poc/src/` en open een terminal.
5. Voer `vagrant cloud auth login` uit en log in.
6. Voer `vagrant up` uit.  
