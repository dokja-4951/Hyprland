-- configs/keybinds.lua

-- Safely reuse the global modifier or fallback
local modifier = mainMod or "SUPER"

-- Standard Applications
hl.bind(modifier .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(modifier .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(modifier .. " + D",      hl.dsp.exec_cmd(menu))

-- Default Browser
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("bash -c 'gtk-launch $(xdg-settings get default-web-browser)'"))

-- Float inline terminal setup
hl.bind(modifier .. " + SHIFT + Return", hl.dsp.exec_cmd(terminal))

-- Dispatcher Objects (trailing () mandatory here)
hl.bind(modifier .. " + Q",         hl.dsp.window.close())
hl.bind(modifier .. " + Space",     hl.dsp.window.float({ action = "toggle" }))
hl.bind(modifier .. " + SHIFT + F", hl.dsp.window.fullscreen())

-- Script Keybind Executions ($HOME string expansion bypassed)
hl.bind(modifier .. " + SHIFT + S", hl.dsp.exec_cmd("bash $HOME/.config/hypr/scripts/screenshot.sh"))
hl.bind(modifier .. " + R",         hl.dsp.exec_cmd("bash $HOME/.config/hypr/scripts/wbrestart.sh"))
hl.bind(modifier .. " + W",         hl.dsp.exec_cmd("bash $HOME/.config/hypr/scripts/wppicker.sh"))
hl.bind(modifier .. " + SHIFT + Q", hl.dsp.exec_cmd("bash $HOME/.config/hypr/scripts/KillActiveProcess.sh"))
hl.bind(modifier .. " + CTRL + B",  hl.dsp.exec_cmd("bash $HOME/.config/hypr/scripts/WaybarStyles.sh"))
hl.bind(modifier .. " + ALT + B",   hl.dsp.exec_cmd("bash $HOME/.config/hypr/scripts/WaybarLayout.sh"))
hl.bind(modifier .. " + L",         hl.dsp.exec_cmd("bash $HOME/.config/hypr/scripts/hyprlock.sh"))

-- Utilities & Status bar binds
hl.bind(modifier .. " + H",         hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))
hl.bind("CTRL + ALT + Delete",     hl.dsp.exec_cmd("hyprctl dispatch exit 0"))
hl.bind(modifier .. " + C",         hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(modifier .. " + SHIFT + E", hl.dsp.exec_cmd("kitty yazi"))
hl.bind(modifier .. " + P",         hl.dsp.exec_cmd("kitty --class clipse -e clipse"))

-- Focus & Window Navigation
hl.bind(modifier .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(modifier .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(modifier .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(modifier .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(modifier .. " + CTRL + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(modifier .. " + CTRL + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(modifier .. " + CTRL + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(modifier .. " + CTRL + down",  hl.dsp.window.move({ direction = "down" }))

-- Repeating Layout Scaling Binds
hl.bind(modifier .. " + SHIFT + left",  hl.dsp.window.resize({ x = -50, y = 0 }),   { repeating = true })
hl.bind(modifier .. " + SHIFT + right", hl.dsp.window.resize({ x = 50,  y = 0 }),   { repeating = true })
hl.bind(modifier .. " + SHIFT + up",    hl.dsp.window.resize({ x = 0,   y = -50 }), { repeating = true })
hl.bind(modifier .. " + SHIFT + down",  hl.dsp.window.resize({ x = 0,   y = 50 }),  { repeating = true })

-- Loop for Workspaces 1-10
for i = 1, 10 do
    local key = i % 10
    hl.bind(modifier .. " + " .. key,         hl.dsp.focus({ workspace = tostring(i) }))
    hl.bind(modifier .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = tostring(i) }))
end

-- Mouse Wheel Workspace Switching
hl.bind(modifier .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(modifier .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Click & Drag Operations
hl.bind(modifier .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(modifier .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Audio Multimedia Keys
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("bash $HOME/.config/hypr/scripts/volume.sh --inc"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("bash $HOME/.config/hypr/scripts/volume.sh --dec"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("bash $HOME/.config/hypr/scripts/volume.sh --toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("bash $HOME/.config/hypr/scripts/brightness.sh --inc"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("bash $HOME/.config/hypr/scripts/brightness.sh --dec"), { locked = true, repeating = true })

-- Player Controller Profiles
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

hl.bind("ALT + p", hl.dsp.exec_cmd("bash $HOME/.config/hypr/scripts/up.sh"))
hl.bind("ALT + o", hl.dsp.exec_cmd("bash $HOME/.config/hypr/scripts/down.sh"))

