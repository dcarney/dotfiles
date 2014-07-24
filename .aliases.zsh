alias ll='ls -alh'
alias lll='ls -lasht'
alias c='clear'
alias g='git'
alias gs='c; git s'
alias gss='c; git ss'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdt='git difftool'
alias ga='git add'
alias gr='git checkout --'
alias gpr='git pr'
alias gpom='git pull origin master'
alias gprom='git pull --rebase origin master'
alias ..='cd ..'
alias src='cd ~/src'
alias api='cd ~/src/relevancy_api'
alias backend='cd ~/src/relevancy_backend'
alias conf='cd ~/src/relevancy_conf'
alias lib='cd ~/src/java_libraries'
alias hist='history'
alias h='history'
alias hgrep='history | grep'
alias untar='tar xvfz'
alias unjar='jar xvf'
alias fs="stat -f \"%z bytes\"" # File size
alias please='sudo'
alias head='head -n 10'
alias tail='tail -n 10'
alias xx='exit'
alias watchdir='watch -n 5 "ls -lasht"'
alias idgaf="echo \"¯\_(ツ)_/¯\""
alias buildin="echo '\nᕕ( ᐛ )ᕗ  buildin...\n'; ./deploy"
alias files="nemo"
alias ipy="ipython"
alias proc_on_port="sudo netstat -nlp | grep"
alias open='xdg-open'

# build w/ 2 threads/core
alias mvn='mvn -T 2C'

# use the 'gce' profile, and don't attempt to verify SSL certs
alias mvn_gce="mvn -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true -Pgce -T 2C"
# list available rubies
alias rubies='ruby-build --definitions'

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

# suffix aliases (aka "open with")
alias -s coffee=vim
alias -s txt=vim
alias -s json=vim
alias -s csv=subl
alias -s log='tail -f'
