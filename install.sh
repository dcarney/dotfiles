#!/bin/bash

cd "$(dirname "$0")"

set -e

echo ''

# Prints a (blue) info decoration, and a newline
#  [ .. ] Stuff is happening
info () {
  printf "  [ \033[00;34m..\033[0m ] $1\n"
}

# Prints a (yellow) prompt decoration
#  [ ?? ] What should I do now?
user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1 "
}

# Prints a (green) success decoration, and a newline
#  [ OK ] Hello World
success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

# Prints a (red) failure decoration, and a newline
#  [FAIL] Something broke
fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}


link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        user "File already exists: $dst, what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

TOLINK=(.tmux.conf .vimrc .vim .gitconfig .zshrc .oh-my-zsh/themes/dcarney.zsh-theme .i3/config .i3status.conf .xmodmap .xinitrc .Xresources .config/dunst/dunstrc .fontconfig)

install_dotfiles () {
  info 'installing dotfiles'

  # create a few dirs that need to exist
  mkdir -p "${HOME}/.i3"
  mkdir -p "${HOME}/.vim/bundle"
  mkdir -p "${HOME}/.config/dunst"

  # clone a few repos if they don't already exist
  dst="${HOME}/.vim/bundle/Vundle.vim"
  info "checking for vundle at $dst..."
  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then
    success "vundle already installed"
  else
    info "installing vundle..."
    git clone https://github.com/gmarik/Vundle.vim.git "${HOME}/.vim/bundle/Vundle.vim"
  fi

  dst="${HOME}/.oh-my-zsh"
  info "checking for oh-my-zsh at $dst..."
  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then
    success "oh-my-zsh already installed"
  else
    info "installing oh-my-zsh..."
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  fi

  local overwrite_all=false backup_all=false skip_all=false

  # link certain files to their $HOME equivalents
  for src in ${TOLINK[@]}
  do
    dst="${HOME}/${src}"
    link_file "${PWD}/$src" "$dst"
  done

  # link in any file that matches *.zsh
  for src in $(find -H $PWD -maxdepth 2 -name '*.zsh')
  do
    dst="${HOME}/$(basename ${src})"
    link_file "$src" "$dst"
  done

  # other links
  mkdir -p ~/.config/fontconfig
  link_file "${HOME}/.fontconfig" "${HOME}/.config/fontconfig/fonts.conf"
}

install_dotfiles

echo ''
echo '  All installed!'

