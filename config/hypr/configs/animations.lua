-- configs/animations.lua

hl.config({
    animations = {
        enabled = true,
    },
})

-- Bezier curves with 2D tables matrix point tracking
local curves = {
    myBezier   = { { 0.05, 0.9 }, { 0.1, 1.05 } },
    been       = { { 0.24, 0.9 }, { 0.25, 0.91 } },
    been2      = { { 0.0, 0.94 }, { 0.5, 0.99 } },
    menu_decel = { { 0.1, 1.0 }, { 0.0, 1.0 } },
    linear     = { { 0.0, 0.0 }, { 1.0, 1.0 } },
    wind       = { { 0.05, 0.9 }, { 0.1, 1.05 } },
    winIn      = { { 0.1, 1.1 }, { 0.1, 1.1 } },
    winOut     = { { 0.3, -0.3 }, { 0.0, 1.0 } },
    slow       = { { 0.0, 0.85 }, { 0.3, 1.0 } },
    overshot   = { { 0.7, 0.6 }, { 0.1, 1.1 } },
    bounce     = { { 1.1, 1.6 }, { 0.1, 0.85 } },
    slingshot  = { { 1.0, -1.0 }, { 0.15, 1.25 } },
    nice       = { { 0.25, 1.0 }, { 0.25, 1.0 } }
}

for name, points in pairs(curves) do
    hl.curve(name, { type = "bezier", points = points })
end

-- Animation structural rules
hl.animation({ leaf = "windowsIn",  enabled = true, speed = 5.0, bezier = "slow", style = "popin" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7.0, bezier = "been", style = "popin 70%" })
hl.animation({ leaf = "windowsMove",enabled = true, speed = 5.0, bezier = "wind", style = "slide" })
hl.animation({ leaf = "border",      enabled = true, speed = 1.0, bezier = "linear" })
hl.animation({ leaf = "fade",        enabled = true, speed = 5.0, bezier = "overshot" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 5.0, bezier = "wind" })
hl.animation({ leaf = "windows",     enabled = true, speed = 5.0, bezier = "bounce", style = "popin" })

