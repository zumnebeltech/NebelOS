# NebulaOS (WIP)

This is a Bluefin-based image with Gnome, Niri, and Hyprland sessions. Using a custom [bootc](https://github.com/bootc-dev/bootc) image using [Bluefin](https://projectbluefin.io/) with NVIDIA drivers. 
Bluefin, and other UBlue projects, reduce quirks from Fedora.

## What's in it

Gnome with Bluefin modifications, Niri and Hyprland.
Niri and Hyprland are being configured to share most of the configurations/applications as systemd services to maintain familiarity. The usual "must-have" applications for a compositor session are a status bar, application launcher, notification daemon, wallpaper manager/setter, idle manager, lock screen, and a polkit agent.
So some services were created for Waybar, NWG Drawer, SwayNotificationCenter, Wpaperd, Swayidle (on niri) or Hypridle (on Hyprland), Swaylock (niri), Hyprlock (hyprland), Wlsunset (niri), Hyprsunset (hyprland), XFCE polkit or LXQT policykit, Deepin polkit or my favorite Gnome polkit agent (not in the repos anymore, unfortunately), Udiskie, Blueman Applet (enables tray icon), KDEConnect

## Notes
All Gnome experimental features are enabled, since some others are already enabled in base Fedora. The main experimental feature to have enabled for NVIDIA GPUs is kms-modifiers
as it is a requirement to have accelerated rendering on Xwayland. It's on NVIDIA's documentation since driver version 470.42.01.

https://download.nvidia.com/XFree86/Linux-x86_64/470.42.01/README/xwayland.html
https://download.nvidia.com/XFree86/Linux-x86_64/575.64.03/README/xwayland.html