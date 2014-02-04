# dead-simple process control
function start () { ~/bin/start/$*;}
function stop () { ~/bin/stop/$*;}

# because I'm forgetful/lazy
function me() { echo '7338372'; }

# cheatsheet shortcuts!
# Ex. 'cheat git' will open ~/doc/cheat/git.txt in my configured editor
function cheat () { $EDITOR ~/doc/cheat/$*.txt; }

# Ex. tarball ./foo  => foo.tar.gz
function tarball_fn() {
  tar -pvczf "${1}.tar.gz" "$@";
}

alias tarball=tarball_fn

function topgrep_fn() {
  top -c -p `pgrep -d, -f ${1}`;
}

alias topgrep=topgrep_fn

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

function unavro_fn() {
  java -jar ~/lib/avro-tools-1.7.4.jar tojson $@
}

alias unavro=unavro_fn
