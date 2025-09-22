# IAC – Week 3 opdrachten

In deze week heb ik met Ansible gewerkt om mijn servers (`db`, `web1` en `web2`) te beheren.  
De opdrachten zijn stap voor stap uitgevoerd en hieronder beschreven, inclusief de outputs en validatie.

---

## Opdracht 1 – Repo & bereikbaarheid

In deze opdracht heb ik Ansible klaargezet om verbinding te maken met mijn drie servers (`db`, `web1` en `web2`).  
Hiervoor heb ik een `ansible.cfg` gemaakt die naar mijn `inventory.ini` wijst. In de inventory heb ik de servers verdeeld in groepen (app en database) en de juiste SSH-key gekoppeld.

---

### Test 1: ad-hoc commando
Eerst probeerde ik met een ad-hoc commando de hosts te pingen:

```bash
ansible all -a "ping -c 1"

````
Dat ging mis, want Ansible voert dan gewoon het Linux ping-commando uit zonder extra logica.
De volledige output staat in: [ping-ad-hoc.txt](outputs/ping-ad-hoc.txt)

### Test 2: Ansible module
Daarna heb ik hetzelfde geprobeerd met de Ansible ping module:
```bash
ansible all -m ansible.builtin.ping
````
Dit werkte meteen goed: alle servers reageerden met pong.
De volledige output staat in [ping-module.txt](outputs/ping-module.txt)

### Conclusie

Het verschil is duidelijk: een ad-hoc commando is handig om snel iets te testen, maar de Ansible-module is veel betrouwbaarder. Je ziet meteen of de verbinding klopt en het is herhaalbaar zonder fouten.


## Opdracht 2 – Packages & services

In deze opdracht moest ik met Ansible nginx installeren en beheren op de app-servers (web1 en web2).

### Playbook draaien

Ik heb hiervoor het playbook 02_packages_services.yml gebruikt. Dit zorgt dat nginx wordt geïnstalleerd en dat de service actief en enabled is:
```bash
ansible-playbook playbooks/02_packages_services.yml
````
Bij de eerste run zag je dat nginx geïnstalleerd werd. Toen ik het playbook daarna nog een keer draaide, gebeurde er niks meer (wat juist goed is). Dat laat zien dat Ansible idempotent werkt: als alles al goed staat, verandert er niks.

### Controleren of nginx draait
Daarna heb ik met een ad-hoc commando gecheckt of de service ook echt actief was:
```bash
ansible app -a "systemctl is-active nginx"
````
De output liet zien dat zowel web1 als web2 gewoon active teruggaven. Top dus.

### Check met curl
Als laatste wilde ik zien of nginx ook echt een webpagina teruggeeft.
Dus deed ik dit:
```bash
ansible app -a "curl -I http://localhost"
````
Beide servers gaven een HTTP/1.1 200 OK terug. Dat betekent dat nginx goed draait en de standaardpagina bereikbaar is.

## Conclusie
Alles werkt zoals het hoort: nginx is geïnstalleerd, draait, en blijft netjes actief. Het is ook fijn dat Ansible bij een tweede run niks onnodigs meer doet.

## Opdracht 3 –

## Opdracht 4 –
