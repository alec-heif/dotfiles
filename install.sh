#!/bin/bash

#Only run in sudo mode
if [[ $EUID -ne 0 ]]; then
  echo "Script must be run as root"
  exit 1
fi

echo "Start overall configuration"

pushd ${0%/*}
./bash/bash_setup.sh
./tmux/tmux_setup.sh
./git/git_setup.sh
./vim/vim_setup.sh
echo "Done!"
popd


