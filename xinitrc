#!/bin/sh

export ANDROID=/opt/android/
export ANDROID_NDK=$ANDROID/ndk/
export ANDROID_SDK=$ANDROID/sdk/
export PATH=~/.bin:~/.xmonad/:~/.cabal/bin:$ANDROID_NDK:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$ANDROID/studio/bin:/opt/eclipse:$PATH

/usr/lib/systemd/systemd --user &

# Configure X
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xscreensaver -no-splash &
xsetroot -cursor_name left_ptr
xcalib ~/.linux/MacOSXColor.icc
feh --bg-fill -z ~/Pictures/Wallpapers

# Start a D-Bus session
source /etc/X11/xinit/xinitrc.d/30-dbus
# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# You probably need to do this too:
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

# Daily apps
tray &
nm-applet &
parcellite &
volumeicon &
terminator &

# Input method
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
fcitx -d

exec dbus-launch --sh-syntax --exit-with-session xmonad
