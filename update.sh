#!/bin/bash

## For Fedora KDE. Not tested on Gnome!
## Updated 2 APR 2018.

dnf upgrade -y

## RPM FUSION
FILENAME="rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
RPMFUSION="https://download1.rpmfusion.org/free/fedora/$(FILENAME)"

wget $(RPMFUSION) && dnf install -y $(FILENAME)

## MS fonts
MSTTFILE="msttcore-fonts-installer-2.6-1.noarch.rpm"
MSTT="https://downloads.sourceforge.net/project/mscorefonts2/rpms/$(MSTTFILE)"

wget $(MSTT) && dnf install -y $(MSTT)

## Stuff to install ...
dnf install -y keepassxc fuse-exfat clementine sqlite wget cabextract aspell emacs vim-enhanced texlive-scheme-full
dnf install -y gstreamer-plugin-bad gstreamer-plugin-ugly R-base gcc-c++ gcc-fortran
dnf install -y "mozilla-fira*"
