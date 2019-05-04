#!/bin/bash

sudo echo "Europe/Helsinki" | sudo tee /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata

# Set locales in /etc/default/locale file
echo "Setting locale..."
echo "# Locale settings
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8">>~/.bash_profile

locale-gen en_US.UTF-8

sudo dpkg-reconfigure locales

sudo apt-get update -y
sudo apt-get install -y build-essential curl git libssl-dev man

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

echo "source ~/.nvm/nvm.sh" >> ~/.bash_profile
source ~/.bash_profile

nvm install 10.15.3
nvm alias default 10.15.3

npm install hexo-cli -g

ssh-keyscan github.com >> ~/.ssh/known_hosts

echo ""
echo "Everything done, have a nice day :-)!"
