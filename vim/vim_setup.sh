#!/bin/bash

#Make sure git is installed
OS_T="$OSTYPE"
if [[ $OS_T == "linux-gnu" ]]
then
  #OS is some flavor of Linux
  python -mplatform | grep centos && PKG_MGR=yum || PKG_MGR=apt-get
  sudo $PKG_MGR update -y
  sudo $PKG_MGR remove -y vim vim-runtime vim-common vim-gui vim-tiny vim-gui
  python -mplatform | grep centos && \
    sudo yum install -y ruby ruby-devel lua lua-devel luajit \
    luajit-devel ctags mercurial python python-devel \
    tcl-devel perl perl-devel perl-ExtUtils-ParseXS \
    perl-ExtUtils-CBuilder perl-ExtUtils-Embed ncurses ncurses-devel git python-pip \
    || sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    ruby-dev mercurial 
  python -mplatform | grep centos && sudo ln -s /usr/bin/xsubpp /usr/share/perl5/ExtUtils/xsubpp
  pushd  ~/
  hg clone https://code.google.com/p/vim
  cd vim
  ./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp \
    --enable-pythoninterp \
    --with-python-config-dir=/usr/lib/python \
    --enable-perlinterp \
    --enable-luainterp \
    --enable-gui=gtk2 --enable-cscope --prefix=/usr
  make VIMRUNTIMEDIR=/usr/share/vim/vim74
  sudo make install
  sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
  sudo update-alternatives --set editor /usr/bin/vim
  sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
  sudo update-alternatives --set vi /usr/bin/vim
  cd ~/
  sudo rm -rf vim
  popd
  sudo $PKG_MGR install -y build-essential cmake

elif [[ $OS_T == "darwin"* ]]
then
  #Mac OS
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null
  brew install git
  brew install mercurial
  xcode-select --install
  pushd ~/
  sudo rm -rf vim
  hg clone https://code.google.com/p/vim
  cd vim
  ./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp \
    --enable-pythoninterp \
    --with-python-config-dir=/usr/lib/python2.7/config \
    --enable-perlinterp \
    --enable-luainterp \
    --enable-gui=gtk2 --enable-cscope --prefix=/usr
  sudo make && sudo make install
  popd
  brew install cmake
fi

# add vimrc
[ -e ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.old
cp .vimrc ~/.vimrc

# add .vim
[ -e ~/.vim ] && mv ~/.vim ~/.vim.old
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/colors
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp colors/solarized.vim ~/.vim/colors/
vim +PluginInstall +qall
pushd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
brew install node
brew install npm
cd ../tern_for_vim
npm install
popd
