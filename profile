# /etc/profile
if [[ "$(tty)" == "/dev/tty1" ]]
 then
  exec Hyprland
  # do whatever you want here
fi
