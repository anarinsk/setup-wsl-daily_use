#!/bin/bash
cd ${ZSH_CUSTOM1:-$ZSH/custom}/plugins
sudo git clone https://github.com/djui/alias-tips.git
sudo git clone https://github.com/zsh-users/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
#sudo git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
#sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
sed -i 's/plugins=((git)/plugins=(git alias-tips zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
#
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1