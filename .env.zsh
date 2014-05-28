# vi mode!
bindkey -v

# turn off annoying bells
setopt nobeep

# lets files beginning with a . be matched w/o explicitly specifying the dot
setopt globdots

# /usr/local instead of 'cd /usr/local', .. instead of 'cd ..', etc.
setopt auto_cd

# load the super-handy zmv fn
autoload -U zmv

# set up cmd line editing using $EDITOR
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# env vars
export WORKON_HOME=~/.virtualenvs
export ANT_HOME=/usr/local/ant
export GOROOT=/usr/local/go
export MAVEN_OPTS="-Xms512m -Xmx1024m -XX:PermSize=256m -XX:MaxPermSize=512m"
export EDITOR=vim
export GUI_EDITOR=mvim

# add my junk to the PATH
export PATH=/usr/local/bin:/usr/local/sbin:"$GOROOT/bin":"$GOPATH/bin":"$PATH":~/.rbenv/bin:~/bin:~/scripts:~/script:~/bin/bdutil:~/bin/google-cloud-sdk/bin
export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib:/usr/lib/x86_64-linux-gnu

export R_HOME=/usr/lib/R
export JAVA_HOME=/usr/local/java/jdk1.7.0_51/

export HADOOP_HOME=/usr/lib/hadoop
export HADOOP_INSTALL=/usr/lib/hadoop
export PATH=$PATH:$HADOOP_INSTALL/bin
export PATH=$PATH:$HADOOP_INSTALL/sbin
export HADOOP_MAPRED_HOME=$HADOOP_INSTALL
export HADOOP_COMMON_HOME=$HADOOP_INSTALL
export HADOOP_HDFS_HOME=$HADOOP_INSTALL/client
export YARN_HOME=$HADOOP_INSTALL

export TERM=xterm-256color

# enable shims in rbenv
eval "$(rbenv init -)"

# enable virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh
