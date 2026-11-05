-- configs/input.lua

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,
        sensitivity = 0.0,
        accel_profile = "flat",

        touchpad = {
            natural_scroll = true,
        },
    },
})

-- Logitech G502 Hero Mouse
hl.device({
    name = "logitech-g502-hero-gaming-mouse",
    sensitivity = -0.5,
})

-- Compx Hydra Mouse
hl.device({
    name = "compx-hydra--10-mouse",
    sensitivity = 0.0,
})

