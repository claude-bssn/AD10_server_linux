#!/bin/bash
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get install -y ufw
  sudo ufw default deny incoming
  sudo ufw default allow outgoing
  
  # Autoriser les connexions pour les services requis
  sudo ufw allow ssh
  sudo ufw allow http
  sudo ufw allow https

  # Autoriser l'accès au répartiteur de charge (HAProxy) depuis le réseau privé
  sudo ufw allow from 192.168.20.3 to any port 80
  # sudo ufw deny from 192.168.20.4 to any port 80
  # sudo ufw deny from 192.168.20.5 to any port 80
  # sudo ufw deny from any to 192.168.20.4
  
  # sudo ufw enable
  sudo ufw --force enable
