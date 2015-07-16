#!/bin/bash

echo "Setting up bash configuration"
cp bash/.git-completion.bash ~/.git-completion.bash
cp bash/.bashrc ~/.bashrc
cp bash/.inputrc ~/.inputrc
cp bash/.bash_profile ~/.bash_profile
bind -f ~/.inputrc
source ~/.bashrc
echo "Done setting up bash configuration"
