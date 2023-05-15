#!/bin/bash
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get install -y apache2
  sudo systemctl enable apache2
  sudo systemctl start apache2