#!/usr/bin/env bash
# Copies ./config/* into ~/.config (existing folders are backed up first)
set -euo pipefail
src="$(cd "$(dirname "$0")" && pwd)/config"
dst="${XDG_CONFIG_HOME:-$HOME/.config}"
bak="$dst/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

for d in "$src"/*/; do
  n="$(basename "$d")"
  if [ -e "$dst/$n" ]; then mkdir -p "$bak"; mv "$dst/$n" "$bak/$n"; fi
  cp -r "$d" "$dst/$n"
done
chmod +x "$dst"/hypr/scripts/*.sh "$dst"/waybar/scripts/* 2>/dev/null || true

# default waybar layout + style (switch later with WaybarLayout.sh / WaybarStyles.sh)
ln -sfn "$dst/waybar/configs/1.9 config.jsonc" "$dst/waybar/config"
ln -sfn "$dst/waybar/style/1.9 style.css"      "$dst/waybar/style.css"

echo "Done. Backups (if any): $bak"
echo "Next: matugen image ~/Pictures/wallpapers/<your-wallpaper>   # regenerates all colours"
