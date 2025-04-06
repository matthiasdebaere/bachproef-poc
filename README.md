# bachproef-poc
Deze repository bevat alle benodigde bestanden om de PoC omgeving eenvoudig te reproduceren met behulp van VirtualBox en Vagrant op een Windows toestel.

# Installatie
## Prerequisites
1. Schakel virtualisatie in via UEFI (BIOS).  
2. Schakel Core Isolation uit in Windows.

## VirtualBox  
> ⚠️ **Waarschuwing**: Installeer niet de nieuwste versie (7.1), want deze is niet compatibel met Vagrant.  
1. Download en installeer VirtualBox (versie 7.0.20):  
   [https://www.virtualbox.org/wiki/Download_Old_Builds_7_0](https://www.virtualbox.org/wiki/Download_Old_Builds_7_0)

## Vagrant  
1. Download en installeer Vagrant:  
   [https://www.vagrantup.com/](https://www.vagrantup.com/)  
2. Clone de repository:  
   `https://github.com/matthiasdebaere/bachproef-poc.git`  
3. Navigeer naar `bachproef-poc/src/` en open een terminal.  
4. Voer `vagrant up` uit.  
