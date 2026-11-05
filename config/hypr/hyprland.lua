-- Hyprland Lua config. Split into modules under configs/.

-- Monitors
hl.monitor({
    output = "",
    mode = "2560x1440@300",
    position = "auto",
    scale = 1,
})

require("configs.env")
require("configs.autostart")
require("configs.looknfeel")
require("configs.animations")
require("configs.windowrules")
require("configs.input")
require("configs.keybinds")
