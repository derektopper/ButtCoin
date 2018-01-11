
Debian
====================
This directory contains files used to package buttcoind/buttcoin-qt
for Debian-based Linux systems. If you compile buttcoind/buttcoin-qt yourself, there are some useful files here.

## buttcoin: URI support ##


buttcoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install buttcoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your buttcoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/buttcoin128.png` to `/usr/share/pixmaps`

buttcoin-qt.protocol (KDE)

