hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification
        accel_profile = "flat",
        force_no_accel = true,

        touchpad = {
            natural_scroll = true,
        },
    },
})

-- Per-device config
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})
