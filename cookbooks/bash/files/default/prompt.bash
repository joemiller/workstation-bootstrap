################################################################################
### This file installed by Chef. If you run bootstrap again, you'll lose
### any changes made here.
################################################################################

# this will set the iterm2 tab name to 'local:<current directory>'
PS1="$PS1\[$(echo -e '\033];LOCAL:$(basename $PWD)\007')\]"
