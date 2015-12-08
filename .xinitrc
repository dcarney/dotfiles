# configure keyboard bindings
xmodmap ~/.xmodmap

# set a keyboard repeat rate of 40, starting after 200ms
xset r rate 200 40

# load the X resources DB (this should remove any need for the obsolete ~/.Xdefaults) 
xrdb ~/.Xresources

exec i3
