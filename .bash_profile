alias finder='open -a finder'
alias ll='ls -al'                   
alias c='clear'
alias g='git'
alias gs='c; git status'

export ANT_HOME=/usr/local/ant
export JDK_HOME=/System/Library/Frameworks/JavaVM.framework
export JAVA_HOME=/Library/Java/Home
export CATALINA_HOME=/Library/Tomcat/Home
export SVN_EDITOR=vim

# add my junk to the PATH
export PATH="$PATH":~/bin:~/scripts

# set up pretty colors
export CLICOLOR=1
export LSCOLORS=hxxxxxxxbxxxxxxxxxxxxx

# LSCOLORS needs 11 sets of letters indicating foreground and background colors:
# directory
# symbolic link
# socket
# pipe
# executable
# block special
# character special
# executable with setuid bit set
# executable with setgid bit set
# directory writable to others, with sticky bit
# directory writable to others, without sticky bit
# The possible letters to use are:

# a  black
# b  red
# c  green
# d  brown
# e  blue
# f  magenta
# c  cyan
# h  light grey
# A  block black, usually shows up as dark grey
# B  bold red
# C  bold green
# D  bold brown, usually shows up as yellow
# E  bold blue
# F  bold magenta
# G  bold cyan
# H  bold light grey; looks like bright white
# x  default foreground or background

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

# Make sure the virtualenvwrapper uses the correct Python version
export VIRTUALENVWRAPPER_PYTHON=/Library/Frameworks/Python.framework/Versions/2.7/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenv

# use the virtualenvwrapper script
export WORKON_HOME=$HOME/.virtualenvs
source /Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh

# Use virtualenv, but don't let it change the bash prompt
# export VIRTUAL_ENV_DISABLE_PROMPT=1
# source ~/.venv/base/bin/activate

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
export PATH="$PATH":/Library/Frameworks/Python.framework/Versions/2.7/bin

