#!/bin/bash
# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0
#!/bin/bash

sudo echo "ubuntu:ubuntu" | chpasswd
sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config.d/*
sudo /etc/init.d/ssh restart
sudo mkdir -p /home/ubuntu/.ssh/
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC9dg3T98uK3lonKY0EY7TYBJHB9+wmQxRgPphn+BETIrHtgcWZY+idCVK/UDcaIGo4AS52FRNsmTsPWhRI2b8PJUBbCNVvDifv2Kglry9/DK2k4gqVQXo/SkfFcfVL1ZnItcleY3MPaBW+tEaoLr2XX1I4pAI+R8h9DSiJAgwDu9F7JdDOw7zt0y1uYysZ/GmuoBMkXy6N2aA29TpfzpNSCJCk0Sv+7cM6o6FqTdc4uXmuQXfcIWC58nJwI+xEveGo0iNDGTZhO2QRhVv0HqhoFiLLI+s4NH6N+Reb1rbHcDVdrbj2BXK3QrIAR/JGpUjNhzYy/7WjXtY2+eqw67oh9TfuIYDhLoJcDmpT6fgi0JGmtNASkkgZTMO2Nu1kaA25genskXQz8VktL6dEOSoOA04selFFBIJmc3M4SSQXTO0WXLP8RYP8Pw+X+UiB/wysjZ92opsUJYQ4jSC2c3qyKNqKiyu7OtEF06dlcDPGj6sx8nwkxO8pDdachPHYA2U=" >> /home/ubuntu/.ssh/authorized_keys
sudo apt-get update -y
sudo apt-get install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
echo "${file_content}!" | sudo tee /var/www/html/index.html
sudo rm -f /var/www/html/index.nginx-debian.html


