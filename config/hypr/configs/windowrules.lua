-- configs/windowrules.lua

-- APPLICATION OPACITY AND BLUR
hl.window_rule({ match = { class = "^multimedia_video.*" }, no_blur = true })
hl.window_rule({ match = { class = "^multimedia_video.*" }, opacity = "1.0" })
hl.window_rule({ match = { class = "^settings.*" }, opacity = "0.8" })
hl.window_rule({ match = { class = "^org\\.gnome\\.Nautilus$" }, opacity = "0.8" })
hl.window_rule({ match = { class = "^(gedit|org\\.gnome\\.TextEditor|mousepad)$" }, opacity = "0.9" })
hl.window_rule({ match = { class = "^code-oss$" }, opacity = "0.8" })

-- Pavucontrol
hl.window_rule({ match = { class = "^org\\.pulseaudio\\.pavucontrol$" }, float = true })
hl.window_rule({ match = { class = "^org\\.pulseaudio\\.pavucontrol$" }, opacity = "0.9" })
hl.window_rule({ match = { class = "^org\\.pulseaudio\\.pavucontrol$" }, size = { 1200, 800 } })

-- Kitty terminal custom layout position
hl.window_rule({ match = { class = "^kitty$" }, float = true })
hl.window_rule({ match = { class = "^kitty$" }, size = { 800, 500 } })
hl.window_rule({ match = { class = "^kitty$" }, move = { 1450, 400 } })

-- Messaging app opacities
hl.window_rule({ match = { class = "^(discord|vesktop|org\\.telegram\\.desktop)$" }, opacity = "0.85 0.7" })
hl.window_rule({ match = { class = "^Spotify$" }, opacity = "0.8 0.6" })
hl.window_rule({ match = { class = "^librewolf$" }, opacity = "0.85" })
hl.window_rule({ match = { class = "^viewer.*" }, opacity = "0.8" })
hl.window_rule({ match = { class = "^firefox$" }, opacity = "0.85" })

-- Clipse clipboard manager
hl.window_rule({ match = { class = "^clipse$" }, float = true })
hl.window_rule({ match = { class = "^clipse$" }, opacity = "0.8" })
hl.window_rule({ match = { class = "^clipse$" }, size = { 800, 500 } })
hl.window_rule({ match = { class = "^clipse$" }, move = { 1600, 300 } })

-- LAYER RULES (Waybar & system blur)
hl.layer_rule({ match = { namespace = "^waybar$" }, blur = true, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "^logout_dialog$" }, blur = true })

-- SwayNC
hl.layer_rule({ match = { namespace = "^swaync-control-center$" }, blur = true, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "^swaync-control-center$" }, xray = false })

hl.layer_rule({ match = { namespace = "^swaync-notification-window$" }, blur = true, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "^swaync-notification-window$" }, xray = false })

-- WINDOW MANAGEMENT CONSTRAINTS
hl.window_rule({ match = { class = "^settings.*" }, float = true })
hl.window_rule({ match = { class = "^viewer.*" }, float = true })
hl.window_rule({ match = { class = "^multimedia_video.*" }, float = true })
hl.window_rule({ match = { class = "^multimedia_video.*" }, size = { 1280, 720 } })

-- Ignore maximize requests from all windows
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })

-- Fix cursor dragging constraints over XWayland windows
hl.window_rule({ match = { class = "^$" }, no_focus = true })

-- SYSTEM POPUPS AND DIALOGUES
hl.window_rule({ match = { title = "^(Save As|Save a File|Pick Files)$" }, float = true })
hl.window_rule({ match = { title = "^(Save As|Save a File|Pick Files)$" }, size = "50% 60%" })
hl.window_rule({ match = { title = "^(Save As|Save a File|Pick Files)$" }, center = true })

hl.window_rule({ match = { initial_title = "^Open Files$" }, float = true })
hl.window_rule({ match = { initial_title = "^Open Files$" }, size = "70% 60%" })

-- Waydroid
hl.window_rule({ match = { class = "^(waydroid.*)$" }, suppress_event = "maximize" })

