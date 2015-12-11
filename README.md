# dotfiles
### a collection of my dotfiles and misc. config-related bits and scripts

Storing some of my dotfiles here allows easy portaging of my settings and prefs
across machines, and serves as a handy backup.

## installation

The install script will symlink most of the "important" dotfiles into place, and
do a few other simple install steps.  If any files already exist in the symlink
destinations, a prompt will allow for skipping/backing up/overwriting.

    $ ./install.sh
