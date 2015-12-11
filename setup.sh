#!/bin/bash
#
# basic installs/setup that I do on each new machine
#
# as root:
#  apt install sudo
#  adduser dcarney sudo

sudo apt update

sudo apt install \
  build-essential \
  cmake \
  ctags \
  curl \
  fonts-droid \
  fonts-inconsolata \
  fonts-noto \
  git \
  i3 \
  lxappearance \
  make \
  rxvt-unicode-256color \
  slim \
  thunar \
  ttf-ubuntu-font-family \
  tmux \
  vim-nox \
  xclip \
  xorg \
  zsh

# turn off that beep!!!
sudo rmmod pcspkr
sudo echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
