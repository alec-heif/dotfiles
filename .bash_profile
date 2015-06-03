# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

##
# Your previous /Users/aheifetz/.bash_profile file was backed up as /Users/aheifetz/.bash_profile.macports-saved_2013-07-13_at_22:58:41
##

export PATH=/usr/local/bin:$PATH
export PATH=$PATH:~/bin

# OPAM configuration
. /Users/aheifetz/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
