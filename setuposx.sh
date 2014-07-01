#!/bin/sh

############################
# This is the setup script for the CodeHub course
# It gets you up and running with nodejs, git, google chrome, express, mongodb, yeoman, zsh and ohmyzsh
# It also updates stuff

# This assumes you are using some version of OS X , so if you're not, good luck

# Don't run this as root, man
############################

#get sudo permission temporarily
echo "Getting password to do stuff"
sudo echo ""

#get and install git
curl "https://git-osx-installer.googlecode.com/files/git-1.8.4.2-intel-universal-snow-leopard.dmg" -o "git.dmg"
hdiutil attach git.dmg
#TODO add command to launch installer

#get and install xcode

#get and install webstorm
curl "http://download.jetbrains.com/webstorm/WebStorm-8.0.4.dmg?_ga=1.63790056.671941123.1403314849" -o "webstorm.dmg"
hdiutil attach webstorm.dmg

#get and install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

#update homebrew
brew update

#make sure homebrew is ok
brew doctor

#install zsh
brew install zsh

#get and install nodejs and npm
brew install node

#install mongodb
brew install mongodb

#set up git stuff
echo "please enter your name: "
read name
echo "please enter your github email: "
read gitEmail
git config --global user.email "$gitEmail"
git config --global user.name "$name"

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
sudo npm install -g yo

#clear tmp dir
sudo rm -rf ~/tmp

#install yeoman generator
sudo npm -g install generator-angular-fullstack

#clear tmp dir
sudo rm -rf ~/tmp

#clean up after ourselves
rm -rf /tmp/setupstuff

#now you need to, like, reboot
echo 'Reboot yoself son!'
