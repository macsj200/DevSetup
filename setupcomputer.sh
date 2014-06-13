#!/bin/sh

############################
# This is the setup script for the CodeHub course
# It gets you up and running with nodejs, git, google chrome, express, mongodb, yeoman, zsh and ohmyzsh
# It also updates stuff

# This assumes you are using Ubuntu 14.04 LTS, so if you're not, good luck

# Don't run this as root, man
############################

#get sudo permission temporarily
echo "Getting password to do stuff"
sudo echo ""


#make temp directory
mkdir /tmp/setupstuff

#add google chrome ppa
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

#Update yo computah
echo 'Updating apt sterf'
sudo apt-get -y -q update
sudo apt-get -y -q upgrade

#installfest
echo 'Installing a bunch of crap with apt'
sudo apt-get -y install chromium-browser git zsh wget openjdk-7-jdk npm google-chrome-stable

#set up git stuff
echo "please enter your name: "
read name
echo "please enter your github email: "
read gitEmail
git config --global user.email "$gitEmail"
git config --global user.name "$name"





#get and install webstorm
echo "installing webstorm"
wget "http://download.jetbrains.com/webstorm/WebStorm-8.0.3.tar.gz"
tar -zxvf /tmp/setupstuff/WebStorm-8.0.3.tar.gz
sudo mv WebStorm-135.937 /usr/bin
cd /usr/bin
cd WebStorm-135.937/bin
./webstorm.sh

#install ohmyzsh
echo 'Installing ohmyzsh'
wget --no-check-certificate 'http://install.ohmyz.sh' -O - | sh

#change default shell to zsh
echo 'Changing your default shell to zsh'
echo "You'll need to type your password"
chsh -s /bin/zsh

#install express
sudo npm install -g express

#clear tmp dir
sudo rm -rf ~/tmp

#install yeoman
npm install -g yo

#clear tmp dir
sudo rm -rf ~/tmp

#clean up after ourselves
rm -rf /tmp/setupstuff

#now you need to, like, reboot
echo 'Reboot yoself son!'
