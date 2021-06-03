#!/bin/bash

echo "hello world"
sudo apt update
sudo apt install -y mongodb
sudo systemctl stop mongodb
# rm /etc/mongodb.conf
# nano /etc/mongodb.conf
sudo tee /etc/mongodb.conf << EOF

dbpath=/var/lib/mongodb
bind_ip = 0.0.0.0
EOF

sudo systemctl start mongodb
sudo ufw enable
sudo ufw allow from 0.0.0.0/0 to any port 27017  
