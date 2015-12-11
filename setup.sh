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
  curl \
  fonts-droid \
  fonts-inconsolata \
  fonts-noto \
  git \
  i3 \
  lxappearance \
  rxvt-unicode-256color \
  slim \
  thunar \
  vim-nox \
  xclip \
  xorg

# turn off that beep!!!
sudo rmmod pcspkr
sudo echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
