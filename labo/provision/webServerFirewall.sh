#!/bin/bash 
  echo 'iptables-persistent iptables-persistent/autosave_v4 boolean true' | sudo debconf-set-selections
  echo 'iptables-persistent iptables-persistent/autosave_v6 boolean true' | sudo debconf-set-selections
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y iptables-persistent

  # Allow SSH traffic only from machine1
  sudo iptables -A INPUT -p tcp --dport 22 -s 192.168.20.2/32 -j ACCEPT

  # Bloquer tout trafic entrant sauf celui provenant de la machine 1 (pare-feu et répartiteur de charge)
  sudo iptables -A INPUT -s 192.168.20.2/32 -j ACCEPT
  sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
  sudo iptables -A INPUT -j DROP

  # Enregistrer les règles de pare-feu persistantes
  sudo sh -c 'iptables-save > /etc/iptables/rules.v4'