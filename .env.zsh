# vi mode!
bindkey -v

# turn off annoying bells
setopt nobeep

# lets files beginning with a . be matched w/o explicitly specifying the dot
setopt globdots

# env vars
export WORKON_HOME=~/src/virtualenvs
export ANT_HOME=/usr/local/ant
export JDK_HOME=/System/Library/Frameworks/JavaVM.framework
export MAVEN_OPTS="-Xms512m -Xmx1024m -XX:PermSize=256m -XX:MaxPermSize=512m"
export EDITOR=vim
export GUI_EDITOR=mvim
export HADOOP=/usr/local/Cellar/hadoop/1.0.3/libexec

# add my junk to the PATH
export PATH="$PATH":~/bin:~/scripts:~/script
