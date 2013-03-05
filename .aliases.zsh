alias finder='open -a finder'
alias ll='ls -alh'
alias lll='ls -lasht'
alias c='clear'
alias g='git'
alias gs='c; git status'
alias gss='c; git status -s'
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

# build w/ 1 thread/core
alias mvn='mvn -T 1C'

# produce a "stream" of iostats output
alias stats='iostat -w1'

# use htop instead of the crappy OSX top
alias top='htop'

# run my janky fixssh script before attempting any ssh
alias ssh='fixssh; ssh'

# run a script to find the OSX equivalent of ssh-agent, set an env var
# in the current shell environment
alias fixssh='. ~/bin/fix_osx_auth_sock'

# list available rubies
alias rubies='ruby-build --definitions'

# prevent zsh autocorrection on the following:
alias ssh='nocorrect ssh'
alias tmux='nocorrect tmux'
alias rbenv='nocorrect rbenv'

# global aliases
alias -g L="| less"
alias -g NUL="> /dev/null 2>&1"
