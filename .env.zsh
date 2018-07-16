# vi mode!
bindkey -v

bindkey '^R' history-incremental-search-backward

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

export TERM=rxvt-256color

# set TERMINAL, so that urxvt is always first in i3's list of terminals to try
#
# i3-sensible-terminal (which is set up in the .i3/config) tries to
# start one of the following (in that order):
#   $TERMINAL (this is a non-standard variable)
#   x-terminal-emulator (only present on Debian and derivatives)
#   urxvt
#   rxvt
#   terminator
#   Eterm
#   aterm
#   xterm
#   gnome-terminal
#   roxterm
#   xfce4-terminal
export TERMINAL=urxvt

# misc env vars
export WORKON_HOME=~/.virtualenvs
export ANT_HOME=/usr/local/ant
export MAVEN_OPTS="-Xms512m -Xmx1024m -XX:PermSize=256m -XX:MaxPermSize=512m"
export EDITOR=vim
export GUI_EDITOR=mvim

# where I keep all my "did" files for task tracking
export DID_HOME="$HOME/src/did"

# golang
export GOROOT=/usr/local/go
export GOPATH="$HOME/go"
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# k8s cluster configs
export KUBECONFIG="$HOME/.kube/config"

# add my junk to the PATH
export PATH=/usr/local/bin:/usr/local/sbin:"$PATH":~/.rbenv/bin:~/bin:~/scripts:~/script:~/bin/google-cloud-sdk/bin
export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib:/usr/lib/x86_64-linux-gnu

# cowsay!
export PATH=$PATH:/usr/games

# source some other paths, but only if they exist
MOREPATHS=(~/.rbenv/bin ~/bin/google-cloud-sdk/bin)
for dst in ${MOREPATHS[@]}
do
  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then
    export PATH="$PATH":"$dst"
  fi
done

export JAVA_HOME=/usr/local/java/jdk1.7.0_51/

# The next line updates PATH for the Google Cloud SDK.
dst=/home/dcarney/bin/google-cloud-sdk/path.zsh.inc
if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
then
  source /home/dcarney/bin/google-cloud-sdk/path.zsh.inc
fi
