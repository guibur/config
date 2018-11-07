# config
- Title and Command/Custom command: `/usr/bin/byobua`.
- Edit/Keyboard Shortcuts: uncheck `Enable menu access keys`.
- `ln -s` the dot files in dot_files, zshrcs and vimrcs to home.

# keyboard config with sudo rights
evdev.lst and evdev.xml to copy in /usr/share/X11/xkb/rules

ps to `ln -s` in /usr/share/X11/xkb/symbols

# keyboard config without sudo rights

Add in bashrc
```
# change the keyboard config
. ~/Private/config/keyboard/xmodmap/.xmodmap.launcher > out.log 2> /dev/null

```

# TODO on a new computer

## For work
- Encrypt home folder
   0- Install ecryptfs
   1- `sudo adduser --encrypt-home <user>*` pour creer une nouvelle sesion avec un home crypter
   2 - se donner les droit sudo `sudo usermod -aG sudo <user>`
   3- se logger sur la nouvelle session et supprimer la premiere
- Install veracrypt
- Add certificates on Chromium (settings-> advanced ->  and Firefox

## Little things
- change mouse side
- add Alt+5/4/6/2/8 for lecture/davance/return/volume down/volume up [For Ubuntu 18.04, it is in settings/keyboard]

## keyboard

## neovim and byobu

## configs
