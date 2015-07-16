#!/bin/bash

echo "Setting up bash configuration"
cp .git-completion.bash ~/.git-completion.bash
cp .bashrc ~/.bashrc
cp .inputrc ~/.inputrc
cp .bash_profile ~/.bash_profile
bind -f ~/.inputrc
source ~/.bashrc
echo "Done setting up bash configuration"
