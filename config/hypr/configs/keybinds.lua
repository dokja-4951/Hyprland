local programs = require("configs.programs")
local terminal, fileManager, menu = programs.terminal, programs.fileManager, programs.menu

local mainMod = "SUPER"
local scripts = "~/.config/hypr/scripts/"
local exec = hl.dsp.exec_cmd

-- Apps
hl.bind(mainMod .. " + Return", exec(terminal))
hl.bind(mainMod .. " + SHIFT + Return", exec(terminal, { float = true, size = { 800, 550 } }))
hl.bind(mainMod .. " + E", exec(fileManager))
hl.bind(mainMod .. " + SHIFT + E", exec("kitty yazi"))
hl.bind(mainMod .. " + D", exec(menu))
hl.bind(mainMod .. " + B", exec('xdg-open "https://"'))
hl.bind(mainMod .. " + P", exec("kitty --class clipse -e clipse"))
hl.bind(mainMod .. " + C", exec("hyprpicker -a"))

-- Session
hl.bind("CTRL + ALT + Delete", exec("hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + L", exec(scripts .. "hyprlock.sh"))

-- Windows
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", exec(scripts .. "KillActiveProcess.sh"))
hl.bind(mainMod .. " + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle

-- Scripts / bar
hl.bind(mainMod .. " + R", exec(scripts .. "wbrestart.sh"))
hl.bind(mainMod .. " + SHIFT + S", exec(scripts .. "screenshot.sh"))
hl.bind(mainMod .. " + W", exec(scripts .. "wppicker.sh"))
hl.bind(mainMod .. " + CTRL + B", exec(scripts .. "WaybarStyles.sh"))
hl.bind(mainMod .. " + ALT + B", exec(scripts .. "WaybarLayout.sh"))
hl.bind(mainMod .. " + H", exec("pkill -SIGUSR1 waybar")) -- hide waybar
hl.bind("ALT + p", exec(scripts .. "up.sh"))
hl.bind("ALT + o", exec(scripts .. "down.sh"))

-- Focus / move / resize with arrow keys
local directions = { left = "left", right = "right", up = "up", down = "down" }
local resizes = {
    left = { x = -50, y = 0 }, right = { x = 50, y = 0 },
    up = { x = 0, y = -50 },   down = { x = 0, y = 50 },
}
for key, dir in pairs(directions) do
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = dir }))
    hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ direction = dir }))
    hl.bind(mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.resize({ x = resizes[key].x, y = resizes[key].y, relative = true }),
        { repeating = true })
end

-- Workspaces: switch with mainMod + [0-9], move window with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume and brightness
local keepHeld = { locked = true, repeating = true }
hl.bind("XF86AudioRaiseVolume", exec(scripts .. "volume.sh --inc"), keepHeld)
hl.bind("XF86AudioLowerVolume", exec(scripts .. "volume.sh --dec"), keepHeld)
hl.bind("XF86AudioMute", exec(scripts .. "volume.sh --toggle"), keepHeld)
hl.bind("XF86AudioMicMute", exec("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), keepHeld)
hl.bind("XF86MonBrightnessUp", exec(scripts .. "brightness.sh --inc"), keepHeld)
hl.bind("XF86MonBrightnessDown", exec(scripts .. "brightness.sh --dec"), keepHeld)

-- Media (requires playerctl)
hl.bind("XF86AudioNext", exec("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", exec("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", exec("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", exec("playerctl previous"), { locked = true })
