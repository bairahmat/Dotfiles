#!/bin/bash

#
# Ubuntu new distro initialization script
#

# Update sources
sudo apt-get update

# Upgrade outdated packages
sudo apt-get upgrade -y

# Install basic dev necessities
sudo apt-get install -y git zsh curl wget build-essential

#
# Mean Stack
#

# Install Node.js (v7.x.x)
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# Install Angular CLI
sudo npm install -g @angular/cli

#
# LAMP stack
#

# Install Apache 2 and allow in firewall
sudo apt-get update
sudo apt-get install -y apache2
sudo ufw allow in "Apache Full"

# Install postgres
sudo apt-get install -y postgresql postgresql-contrib

# Install PHP
sudo apt-get install -y php libapache2-mod-php php-mcrypt php-mbstring

# Install Composer
sudo apt-get update
sudo apt-get install -y unzip
cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php
php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

#
# Other
#


# Change shell to ZSH and download ohmyzsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
