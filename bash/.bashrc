set -o vi

if [[ $OS_T == "linux-gnu" ]]
then
  python -mplatform | grep centos && sudo yum install -y bash-completion || sudo apt-get install -y bash-completion
  if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
elif [[ $OS_T == "darwin"* ]]
then
  brew install bash-completion
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-sed/bin:/usr/local/opt/findutils/bin:/Users/aheifetz/scripts:/opt/local/bin:/Users/aheifetz/bin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
if [ -e /usr/libexec/java_home ]
then
  export JAVA_HOME=$(/usr/libexec/java_home)
  export JRE_HOME=$(/usr/libexec/java_home)
  export PATH=$JAVA_HOME:$PATH
fi
if [ -e /usr/local/opt/groovy/libexec ]
then
  export GROOVY_HOME="/usr/local/opt/groovy/libexec"
  export PATH=$GROOVY_HOME:$PATH
fi
export PATH="/usr/local/bin/ant/bin:$PATH"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias sudo='sudo '

source ~/.git-completion.bash

alias ls='ls -G'
alias ll='ls -a1F'
alias la='ls -A'
alias l='ls -CF'
alias sl='ls'

alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit --amend'
alias gd='git diff --color -b'
alias gdc='git diff --color -b --cached'
alias gdh='git diff --color -b HEAD~1 HEAD'
alias ge='git clean -fd'
alias gf='git fetch origin'
alias gfr='git fetch origin; git rebase origin/develop-stable'
alias gh='git checkout'
alias ghb='git checkout -b'
alias gl='git log'
alias gm='git mergetool'
alias gp='git push origin HEAD:refs/for/develop'
alias gr='git rebase'
alias grc='git rebase --continue'
alias grd='git rebase origin/develop-stable'
alias gs='git status'
alias hlog='git log --date-order --all --graph --format="%C(green)%h %Creset%C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset %s"'

__git_complete ga _git_add
__git_complete gb _git_branch
__git_complete gh _git_checkout
__git_complete gr _git_rebase

alias tmux="TERM=screen-256color-bce tmux"

alias info='info --vi-keys'

# Override tilde expansion in bash_completion
_expand()
{
  return 0;
}

# move up directories quickly
up ()
{
  [ "$#" -eq 1 -a "$1" -gt 0 ] || { echo 'Usage: up <number of directories up>'; return 1; }
  up=""
  for (( i = 1; i <= $1; i++));
  do 
    up="$up../"
  done
  cd $up
}

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
