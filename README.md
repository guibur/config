# config
- Title and Command/Custom command: `/usr/bin/byobua`.
- Edit/Keyboard Shortcuts: uncheck `Enable menu access keys`.
- `ln -s` the dot files in dot_files and vimrcs to home.

# keyboard config with sudo rights
evdev.lst and evdev.xml to copy in /usr/share/X11/xkb/rules

ps to `ln -s` in /usr/share/X11/xkb/symbols

# keyboard config without sudo rights

Add in bashrc
```
# change the keyboard config
. ~/Private/config/keyboard/xmodmap/.xmodmap.launcher > out.log 2> /dev/null

```

