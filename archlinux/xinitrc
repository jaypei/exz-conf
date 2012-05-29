#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice


# ibus
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus
# scim
#export XIM=scim
#export XIM_PROGRAM=scim
#export XMODIFIERS="@im=SCIM"
#export GTK_IM_MODULE="scim"
#export QT_IM_MODULE="scim"
#scim -d
# fcitx
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

# start xfce
exec ck-launch-session dbus-launch --exit-with-session startxfce4
/usr/bin/xscreensaver -no-splash &

#fcitx &


