-- hyprland.lua
-- Entry point Hyprland loads: $XDG_CONFIG_HOME/hypr/hyprland.lua

-- 1. Load your colors array first
colors = require("colors")

------------------
---- MONITORS ----
------------------
-- Wildcard layout fallback mapping
hl.monitor({
    output = "",
    mode = "2560x1440@300",
    position = "auto",
    scale = 1.0,
})

---------------------
---- MY PROGRAMS ----
---------------------
-- Declared globally (no 'local') so configs/keybinds.lua can read them
mainMod = "SUPER"
terminal = "kitty"
fileManager = "nautilus"
menu = "rofi -show drun"

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("waybar")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("swaync")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("clipse -listen")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("protonvpn-app")
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 22")

    -- Fixed trailing background fork (&) to avoid startup sequence freezes
    hl.exec_cmd('kitty --class ttyclock sh -c "tty-clock -c -b" &')
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "22")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "22")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

----------------------------
---- REQUIRE SUB-MODULES ---
----------------------------
require("configs.tags")
require("configs.looknfeel")
require("configs.animations")
require("configs.windowrules")
require("configs.input")
require("configs.keybinds")
--------------
---- CLOCK ----
--------------
-- Correct unified window rule table layout
hl.window_rule({
    match = { class = "^ttyclock$" },
    float = true,
    size = { 800, 500 },
    move = { 1560, 138 }
})

