# tunnels traffic to a remote server/port over an SSH tunnel on a localhost port
#
# `ssh -f root@foobar.example.com -L 1234:foobar.example.com:8080 -N
# The -f tells ssh to go into the background just before it executes the command
# the -N instructs OpenSSH to not execute a command on the remote system.
#
# usage: to tunnel traffic for foobar.example.com:8080 over localhost:1234:
#   tunnel foobar.example.com 8080 1234
function tunnel() {
  ssh -f $1 -L $3:$1:$2 -N
}

# Sets a reminder notification (ideally using `dunst`) for N minutes from now.
#
# usage: remind 5 "check on that one thing"
function remind() {
  echo "notify-send \"$2\"" | at now + $1 min
}

# dead-simple process control
function start () { ~/bin/start/$*;}
function stop () { ~/bin/stop/$*;}

# because I'm forgetful/lazy
function me() { echo '7338372'; }

# cheatsheet shortcuts!
# Ex. 'cheat git' will open ~/doc/cheat/git.txt in my configured editor
function cheat () { $EDITOR ~/doc/cheat/$*.txt; }

# Ex. tarball ./foo  => foo.tar.gz
function tarball {
  tar -pvczf "$1.tar.gz" $@;
}

function topgrep() {
  top -c -p `pgrep -d, -f $1`;
}

# shameslessly copied from the oh-my-zsh plugin
#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function current_repository() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}

function git_publish() {
  # git pull --rebase origin foobar && git push origin foobar
  gpr origin `current_branch` && g push origin `current_branch`
}

alias gpub=git_publish

function unavro() {
  java -jar ~/lib/avro-tools-1.7.6.jar tojson $@
}

function avrocompile() {
  java -jar ~/lib/avro-tools-1.7.6.jar compile -string schema $@ .
}

function dockertail() {
  docker ps | grep $1 | cut -d' ' -f1 | xargs -I {} docker logs -t -f {}
}

function dockernuke() {
  docker stop $1 && docker kill $1 && docker rm $1
}

# create the pane with irssi's nicklist
function irssi_nickpane() {
    tmux renamew irssi                                              # name the window
    tmux -q setw main-pane-width $(( $(tput cols) - 21))            # set the main pane width to the total width-20
    tmux splitw -v "cat ~/.irssi/nicklistfifo"                      # create the window and begin reading the fifo
    tmux -q selectl main-vertical                                   # assign the layout
    tmux selectw -t irssi                                           # select window 'irssi'
    tmux selectp -t 0                                               # select pane 0
}

# irssi wrapper
function irssiss() {
    irssi_nickpane
    $(which irssi)                                                  # launch irssi
}

# repair running irssi's nicklist pane
function irssi_repair() {
    tmux selectw -t irssi
    tmux selectp -t 0
    tmux killp -a                                                   # kill all panes
    irssi_nickpane
}

