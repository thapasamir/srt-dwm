#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#polikit-gnome

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

#statusbar
dwmbar 2>&1 >/dev/null &


#THis hide the mouse after three second
unclutter --timeout 3 &

#compoisoter
picom -f &


#wallpaper

feh --randomize --bg-fill /home/samir/wallpaper/ &

#/usr/local/bin/setbg &

#Execute dwm
#loop
while true; do
	dwm >/dev/null 2>&1
done


exec dwm


