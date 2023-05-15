  # !/bin/bash 
  sudo apt-get install -y openssh-server

  # Configurer SSH pour accepter les connexions par clé uniquement
  sudo sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config

  # Redémarrer le service SSH pour appliquer les modifications
  sudo service ssh restart

  # Ajouter la bastion_acces.pub to authorized_keys
  