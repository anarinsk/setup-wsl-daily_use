#!/bin/bash

sudo sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list # package
sudo sed -i 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list # security

sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y

sudo apt-get install zsh
chsh -s `which zsh`
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"