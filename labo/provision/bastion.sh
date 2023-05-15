# !/bin/bash 
  list_ip=$1

  sudo apt-get install -y openssh-server

  # Configurer SSH pour accepter les connexions par clé uniquement
  sudo sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config

  # Redémarrer le service SSH pour appliquer les modifications
  sudo service ssh restart

  # Créer le répertoire .ssh pour l'utilisateur vagrant
  sudo mkdir -p /home/vagrant/.ssh
  sudo chown vagrant:vagrant /home/vagrant/.ssh
  sudo chmod 700 /home/vagrant/.ssh

  # gerate key bation_access
  sudo ssh-keygen -t rsa -b 4096 -f /home/vagrant/.ssh/bation_access -N ""
  for ip in $list_ip[@] do
    ssh-copy-id -i ~/.ssh/bastion_acces.pub $ip
  done

  # Ajouter la clé publique à authorized_keys
  echo "<YOUR_SSH_HERE>" | sudo tee -a /home/vagrant/.ssh/authorized_keys
  sudo chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys
  sudo chmod 600 /home/vagrant/.ssh/authorized_keys