# essentials
alias ll='ls -alh'
alias lll='ls -lasht'
alias c='clear'
alias ..='cd ..'
alias hist='history'
alias h='history'
alias hgrep='history | grep'
alias untar='tar xvfz'
alias xx='exit'
alias please='sudo'
alias fuck='sudo $(fc -ln -1)'

# git related
alias g='git'
alias gs='c; git s'
alias gss='c; git ss'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdt='git difftool'
alias ga='git add'
alias gr='git checkout --'
alias gprom='git pull --rebase origin master'
alias gg='git grep -n'

# locations
alias src="cd $HOME/src"
alias golang="cd $GOPATH"

# irssi - ensures the row-refresh functionality works properly
alias irssi='TERM=screen-256color irssi'

alias files="thunar"

# misc
alias unjar='jar xvf'
alias fs="stat -f \"%z bytes\"" # File size
alias head='head -n 10'
alias watchdir='watch -n 5 "ls -lasht"'
alias idgaf="echo \"¯\_(ツ)_/¯\""
alias buildin="echo '\nᕕ( ᐛ )ᕗ  buildin...\n'; ./deploy"
alias proc_on_port="sudo netstat -nlp | grep"
alias open='xdg-open'
alias ipaddr='ip addr show eth0 | grep -o -E "inet\ [0-9\.]+" | cut -d" " -f2'

# strips ANSI color codes from input
alias strip_color='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"'
alias epoch='date +%s'

alias slack="nohup docker run --rm -t \
 -v /etc/machine-id:/etc/machine-id:ro \
 -v /etc/localtime:/etc/localtime:ro \
 -v /tmp/.X11-unix:/tmp/.X11-unix \
 -e DISPLAY=unix$DISPLAY \
 --device /dev/snd:/dev/snd \
 -v /var/run/dbus:/var/run/dbus \
 -v $HOME/.scudcloud:/home/user/.config/scudcloud \
 --name slack \
 dcarney/scudcloud \
 < /dev/null >> /dev/null 2>&1 & "

# build w/ 2 threads/core
alias mvn='mvn -T 2C'
# don't attempt to verify SSL certs
alias mvn_insecure="mvn -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true -T 2C"

# prevent zsh autocorrection on the following:
alias ssh='nocorrect ssh'
alias tmux='nocorrect tmux'
alias pstree='nocorrect pstree'
alias pgrep='nocorrect pgrep'
alias cap='nocorrect cap'
alias node='nocorrect node'
alias jrnl='nocorrect jrnl'

# global aliases
alias -g L="| less"
alias -g NUL="> /dev/null 2>&1"
