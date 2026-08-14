-- configs/looknfeel.lua

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,

        -- Fixed multi-color container layout
        col = {
            active_border = { colors = { colors.outline } },
            inactive_border = { colors = { colors.outline_variant } },
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 10,
        rounding_power = 2, -- Verified active option string mapping

        active_opacity = 1.0,
        inactive_opacity = 0.8,

        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a,
        },

        blur = {
            enabled = true,
            size = 5,
            passes = 3,
            ignore_opacity = true,
            new_optimizations = true,
            special = false,
            popups = true,
            xray = true,
            vibrancy = 0.1696,
        },
    },
})

