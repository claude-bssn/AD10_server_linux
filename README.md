# Système
• Quel est le chemin du fichier permettant de connaître la version de DEBIAN ?
le chemin est ```/etc/os-release```
la commande pour y avoir accès est ```cat /etc/os-release```

• Quelle est la commande permettant de connaître la date et l’heure définie sur le système ?

la commande pour afficher la date et ;l'heure systeme est ```date```
```Tue May  2 09:29:25 UTC 2023```
• Quelle est la timezone du système ?
avec la commande ```timedatectl```
```Time zone: Etc/UTC (UTC, +0000)```
• Quelle est la commande permettant de modifier la timezone du système ?
la cdm est ```sudo timedatectl set-timezone <Votre_Timezone>```
Cmd pour afficher la liste des timezone
```timedatectl list-timezones```

``` 
vagrant@bullseye:~$ sudo timedatectl set-timezone Europe/Paris
vagrant@bullseye:~$ timedatectl
               Local time: Tue 2023-05-02 11:40:05 CEST
           Universal time: Tue 2023-05-02 09:40:05 UTC
                 RTC time: Tue 2023-05-02 09:40:06
                Time zone: Europe/Paris (CEST, +0200)
System clock synchronized: yes
              NTP service: active
          RTC in local TZ: no 
```

• Quelle est la commande permettant de créer un fichier file.txt et son contenu « test » en une seule
ligne ?
``` echo test > file.txt```

```
vagrant@bullseye:~$ ls
vagrant@bullseye:~$ echo test > file.txt
vagrant@bullseye:~$ ls
file.txt
```

• Quelle est la commande permettant de connaître le nom du système (nom d’hôte) ?  
```hostname -f```  
le flag ```-f``` nous donnera le nom complet

• Quelle est la commande permettant de modifier le nom d’hôte du système ?  
 ``` sudo hostnamectl set-hostname <nouveau_nom> ```

### ou  
```sudo vim /etc/hosts```  
et modifier la ligne correspondant au nom a modifier ```127.0.0.1    nouveau_nom localhost``` 

• Quelle est la commande permettant de redémarrer système ?  
```sudo reboot```

• Quelle est la commande permettant de savoir depuis combien de temps le système tourne ?  
```uptime```

résultat ```11:49:34 up 31 min,  1 user,  load average: 0.00, 0.00, 0.00```

• Quelle est la commande permettant de connaître l’espace disque disponible sur le système ?  
```df```
```Filesystem     1K-blocks      Used Available Use% Mounted on
udev              217940         0    217940   0% /dev
tmpfs              47224       420     46804   1% /run
/dev/sda1       20465232    852552  18547772   5% /
tmpfs             236120         0    236120   0% /dev/shm
tmpfs               5120         0      5120   0% /run/lock
vagrant        488245288 475504296  12740992  98% /vagrant
tmpfs              47224         0     47224   0% /run/user/1000
```

• Quelle est la commande permettant de connaître l’espace disque occupé par le répertoire /etc ?    
```du -sh /etc```
### ou
```df -h /etc```

• Quelle est la commande permettant de savoir si le service sshd est démarré ?  
```uptime```

• Quelle est la commande permettant de connaître le PID du service sshd ?  
```systemctl status sshd```
```MainPID=541```

• Quelle est la commande permettant de tuer le processus sshd à l’aide de son PID ?  
```systemctl show -p MainPID sshd```  
```sudo kill -9 514```

• Quelle est la commande permettant de connaître la liste des processus en cours ?  
```ps aux```

• Quelle est la commande permettant de connaître le nom de l’utilisateur actuellement connecté à la
console ?  
```whoami```

• Quelle est la commande permettant de connaître le nom de tous les utilisateurs actuellement
connectés au système ?  
```w -h```

• Quelle est la commande permettant de lancer une commande avec les droits root sans être root ?  
```sudo```

• Quelle est la commande permettant d’éditer le fichier de définition des commandes exécutées
périodiquement ?  
``` crontab -e ```

• Quelle est la commande permettant de vider l’historique de la ligne de commande de l’utilisateur en
cours ?  
```history -c```

# Réseau

• Quelle est la commande permettant de connaître le nom et l’adresse IP de l’interface ethernet ?  
```sudo ip addr show```
 
• Quelle est la commande permettant de connaître l’adresse IP de la passerelle (gateway) ?  
```sudo ip addr show eth0```

• Quel est le chemin du fichier dans lequel sont définis les DNS ?  
``` /etc/resolv.conf ```

• Quelle est la commande permettant de connaître l’adresse IP du DNS racine pour le domaine www.it-akademy. fr ?  
```nslookup www.it-akademy.fr```  

• Quel est le nom du paquet que vous avez du installer pour répondre à la question précédente ?  
```sudo apt-get install dnsutils```
cependant la vm installée avait déjà la commande nslookup inclue

• Quelle est la commande permettant de vérifier que la passerelle est accessible depuis la Debian ?  
```sudo ip addr show``` to get the host reference to ping and then   
```ping <your_ip>```


• Quelle est la commande permettant de connaître les adresses des équipements réseau entre la Debian et le serveur hébergeant it-akademy.fr ?  
```traceroute it-akademy.fr```

• Quelle est la commande permettant de connaître le nom d’hôte de la machine hébergeant it-akademy.fr ?  
```dig it-akademy.fr```

```
; <<>> DiG 9.16.37-Debian <<>> it-akademy.fr
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 16916
;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 13, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;it-akademy.fr.			IN	A

;; ANSWER SECTION:
it-akademy.fr.		300	IN	A	172.66.43.64
it-akademy.fr.		300	IN	A	172.66.40.192

;; AUTHORITY SECTION:
.			6333	IN	NS	b.root-servers.net.
.			6333	IN	NS	i.root-servers.net.
.			6333	IN	NS	j.root-servers.net.
.			6333	IN	NS	f.root-servers.net.
.			6333	IN	NS	g.root-servers.net.
.			6333	IN	NS	d.root-servers.net.
.			6333	IN	NS	a.root-servers.net.
.			6333	IN	NS	h.root-servers.net.
.			6333	IN	NS	c.root-servers.net.
.			6333	IN	NS	m.root-servers.net.
.			6333	IN	NS	e.root-servers.net.
.			6333	IN	NS	l.root-servers.net.
.			6333	IN	NS	k.root-servers.net.

;; Query time: 30 msec
;; SERVER: 10.0.2.3#53(10.0.2.3)
;; WHEN: Tue May 02 13:34:53 CEST 2023
;; MSG SIZE  rcvd: 285
```

• Quel est le chemin du fichier local contenant des correspondances adresses IP / Nom de domaine ?   
```cat /etc/hosts```

• Quelle est la commande permettant de faire pointer le domaine labo.it-akademy.fr vers l’adresse 127.0.0.1 ?  
```sudo nano /etc/hosts```
A la ligne de l'IP ```127.0.0.1``` modifier ```localhost``` par ```labo.it-akademy.fr```


# Scripting

• Créer un script permettant, une fois exécuté, d’afficher la liste des fichiers triés par taille du répertoire /var/log.
Dans le ```~```  
run ```./tri_logs.sh```

• Créer un script permettant, une fois exécuté, d’afficher la liste des fichiers triés par taille du répertoire passé en argument.  
Dans le ```~```  
run ```./tri_dossier.sh```

• Créer un script permettant, une fois exécuté, de mettre à jour les dépôts de paquets Debian, puis de mettre à jour les paquets installés sur le système et de journaliser le tout dans le fichier /var/log/apt/ updated.log.  
Dans le ```~```  
run ```./update_system.sh```
