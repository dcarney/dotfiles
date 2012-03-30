alias finder='open -a finder'
alias ll='ls -al'
alias c='clear'
alias g='git'
alias gs='c; git status'
alias gss='c; git status -s'
alias gd='git diff'
alias ga='git add'
alias gr='git checkout --'
alias gpom='git pull origin master'
alias ..='cd ..'
alias src='cd ~/src'

# File size
alias fs="stat -f \"%z bytes\""

export ANT_HOME=/usr/local/ant
export JDK_HOME=/System/Library/Frameworks/JavaVM.framework
export JAVA_HOME=/Library/Java/Home
export CATALINA_HOME=/Library/Tomcat/Home
export SVN_EDITOR=vim
export EDITOR=vim

# add my junk to the PATH
export PATH="$PATH":~/bin:~/scripts:~/script

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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# http://henrik.nyh.se/2008/12/git-dirty-prompt
#   username@machine dir[master]#   # clean working directory
#   username@machine dir[master*]#  # dirty working directory
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

# sweet prompt, bro
export PS1='\u@\h \[\033[0;37m\]\W\[\033[0m\]$(parse_git_branch)# '

# function for creating growl alerts from iTerm2 
# Example:  something_long; growl "all done"
growl() { echo -e $'\e]9;'${1}'\007' ; return ; }

# cheatsheet shortcuts!
# Ex. 'cheat git' will open ~/doc/cheat/git.txt in my configured editor
function cheat () { $EDITOR ~/doc/cheat/$*.txt; }

