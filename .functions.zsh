# dead-simple process control
function start () { ~/bin/start/$*;}
function stop () { ~/bin/stop/$*;}

# because I'm forgetful/lazy
function me() { echo '7338372'; }

# cheatsheet shortcuts!
# Ex. 'cheat git' will open ~/doc/cheat/git.txt in my configured editor
function cheat () { $GUI_EDITOR ~/doc/cheat/$*.txt; }
