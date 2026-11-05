# Hyprland (Lua config) dotfiles

Hyprland + Waybar + matugen (Material You colours from the wallpaper).

```
config/
  hypr/      hyprland.lua + configs/ (look, animations, rules, input, binds), hyprlock, hypridle, scripts/
  waybar/    configs/ (90 layouts), style/ (90 styles), scripts/ (helpers)
  matugen/   config.toml + templates/  -> writes colours for waybar, hypr, kitty, rofi, cava, gtk, ...
  kitty/ rofi/ swaync/ wlogout/ cava/ fastfetch/
install.sh   copies config/* into ~/.config (backs up what's there)
```

## Install
```bash
git clone -b main https://github.com/dokja-4951/Hyprland && cd Hyprland
./install.sh
matugen image ~/Pictures/wallpapers/<wallpaper>.png
```

## Needs
hyprland (Lua config support), waybar, matugen, awww, rofi, swaync, kitty, wlogout, hyprlock, hypridle,
cava, fastfetch, clipse, pavucontrol, nm-applet, blueman, JetBrainsMono Nerd Font.

## Waybar
`hypr/scripts/WaybarLayout.sh` / `WaybarStyles.sh` pick a layout / style; they symlink
`~/.config/waybar/config` and `style.css`. Colours: every style imports `colors.css` written by matugen.
