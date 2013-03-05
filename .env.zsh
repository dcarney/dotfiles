# vi mode!
bindkey -v

# turn off annoying bells
setopt nobeep

# lets files beginning with a . be matched w/o explicitly specifying the dot
setopt globdots

# /usr/local instead of 'cd /usr/local', .. instead of 'cd ..', etc.
setopt auto_cd

# env vars
export WORKON_HOME=~/src/virtualenvs
export ANT_HOME=/usr/local/ant
export JDK_HOME=/System/Library/Frameworks/JavaVM.framework
export MAVEN_OPTS="-Xms512m -Xmx1024m -XX:PermSize=256m -XX:MaxPermSize=512m"
export EDITOR=vim
export GUI_EDITOR=mvim
export HADOOP=/usr/local/Cellar/hadoop/1.0.3/libexec
export CASSANDRA_HOME=/usr/local/Cellar/cassandra/1.1.7/
# add my junk to the PATH
export PATH=/usr/local/bin:"$PATH":~/bin:~/scripts:~/script

# set up GNU coreutils:
#
# by default, all commands are installed with the prefix 'g'.
# If you really need to use these commands with their normal names, you
# can add a "gnubin" directory to your PATH from your bashrc like:
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Additionally, you can access their man pages with normal names if you add
# the "gnuman" directory to your MANPATH from your bashrc as well:
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export TERM=xterm-256color

# enable shims in rbenv
eval "$(rbenv init -)"
