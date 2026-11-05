-- Opacity
hl.window_rule({ match = { class = "(org.gnome.Nautilus)" }, opacity = "0.8" })
hl.window_rule({ match = { class = "(gedit|org.gnome.TextEditor|mousepad)" }, opacity = "0.9" })
hl.window_rule({ match = { class = "(kitty)" }, opacity = "0.7" })
hl.window_rule({ match = { class = "(discord|vesktop|org.telegram.desktop)" }, opacity = "0.85 override 0.7 override 1 override" })
hl.window_rule({ match = { class = "(spotify|Spotify)" }, opacity = "0.8 override 0.6 override 1 override" })
hl.window_rule({ match = { class = "(firefox)" }, opacity = "0.9 override 0.7 override 1 override" })

-- Floating apps
hl.window_rule({
    match = { class = "(org.pulseaudio.pavucontrol)" },
    opacity = "0.9",
    float = true,
    size = { "(monitor_w*0.5)", "(monitor_h*0.6)" },
})
hl.window_rule({
    match = { class = "(clipse)" },
    opacity = "0.8",
    float = true,
    size = { 800, 500 },
    move = { 1600, 300 },
})

-- Ignore maximize requests from apps
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })

-- Fix some dragging issues with XWayland
hl.window_rule({
    match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
    no_focus = true,
})

-- Popups and dialogues
hl.window_rule({
    match = { title = "(Save As|Save a File|Pick Files)" },
    float = true,
    size = { "(monitor_w*0.5)", "(monitor_h*0.6)" },
    center = true,
})
hl.window_rule({
    match = { initial_title = "(Open Files)" },
    float = true,
    size = { "(monitor_w*0.7)", "(monitor_h*0.6)" },
})

-- Layer rules
hl.layer_rule({ match = { namespace = "waybar" }, blur = true, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "logout_dialog" }, blur = true })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, blur = true, ignore_alpha = 0.5, xray = false })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, blur = true, ignore_alpha = 0.5, xray = false })
