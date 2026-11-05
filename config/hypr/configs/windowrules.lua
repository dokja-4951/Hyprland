-- configs/windowrules.lua
-- One rule table per app: match + every property together.
local function rule(match, props)
    props.match = match
    hl.window_rule(props)
end

------------------------------ OPACITY / BLUR ------------------------------
rule({ class = "^settings.*" },                                   { float = true, opacity = "0.8" })
rule({ class = "^viewer.*" },                                     { float = true, opacity = "0.8" })
rule({ class = "^org\\.gnome\\.Nautilus$" },                      { opacity = "0.8" })
rule({ class = "^(gedit|org\\.gnome\\.TextEditor|mousepad)$" },   { opacity = "0.9" })
rule({ class = "^code-oss$" },                                    { opacity = "0.8" })
rule({ class = "^(discord|vesktop|org\\.telegram\\.desktop)$" },  { opacity = "0.85 0.7" })
rule({ class = "^Spotify$" },                                     { opacity = "0.8 0.6" })
rule({ class = "^librewolf$" },                                   { opacity = "0.85" })
rule({ class = "^firefox$" },                                     { opacity = "0.85" })
rule({ class = "^multimedia_video.*" },                           { float = true, no_blur = true, opacity = "1.0", size = { 1280, 720 } })

------------------------------ FLOATING APPS -------------------------------
rule({ class = "^org\\.pulseaudio\\.pavucontrol$" }, { float = true, opacity = "0.9", size = { 1200, 800 } })
rule({ class = "^clipse$" },                         { float = true, opacity = "0.8", size = { 800, 500 }, move = { 1600, 300 } })
rule({ class = "^ttyclock$" },                       { float = true, size = { 800, 500 }, move = { 1560, 138 } })
-- every kitty window floats (also used by waybar click-actions such as btop/nmtui)
rule({ class = "^kitty$" },                          { float = true, size = { 800, 500 }, move = { 1450, 400 } })

------------------------------ DIALOGS -------------------------------------
rule({ title = "^(Save As|Save a File|Pick Files)$" }, { float = true, size = "50% 60%", center = true })
rule({ initial_title = "^Open Files$" },               { float = true, size = "70% 60%" })

------------------------------ MISC ----------------------------------------
rule({ class = ".*" },            { suppress_event = "maximize" })  -- ignore maximize requests
rule({ class = "^$" },            { no_focus = true })              -- XWayland drag fix
rule({ class = "^(waydroid.*)$" }, { suppress_event = "maximize" })

------------------------------ LAYER RULES ---------------------------------
hl.layer_rule({ match = { namespace = "^waybar$" },                       blur = true, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "^logout_dialog$" },                blur = true })
hl.layer_rule({ match = { namespace = "^swaync-control-center$" },        blur = true, ignore_alpha = 0.5, xray = false })
hl.layer_rule({ match = { namespace = "^swaync-notification-window$" },   blur = true, ignore_alpha = 0.5, xray = false })
