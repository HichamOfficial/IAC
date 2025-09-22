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
````
````
Test 2: Ansible module

Daarna heb ik hetzelfde geprobeerd met de Ansible ping module:
````
ansible all -m ansible.builtin.ping
````
Dit werkte meteen goed: alle servers reageerden met pong.
De volledige output staat in [ping-module.txt](outputs/ping-module.txt)
````
````

Conclusie

Het verschil is duidelijk: een ad-hoc commando is handig om snel iets te testen, maar de Ansible-module is veel betrouwbaarder. Je ziet meteen of de verbinding klopt en het is herhaalbaar zonder fouten.

