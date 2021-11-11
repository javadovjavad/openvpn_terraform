#!/bin/bash
sudo apt-get update -y
echo -e "password\npassword" | passwd openvpn
sudo curl -o setup.sh https://gist.githubusercontent.com/sabbour/84699937169e50b29a46d7d948866f1b/raw/f3eaae99aac4bde9afc0380374030cefeca01b65/setup-certbot-openvpn-letsencrypt.sh
sudo chmod +x setup.sh
sudo ./setup.sh -d "darvaza.az" -e "info@darvaza.az"
