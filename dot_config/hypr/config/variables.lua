hl.config({
    general = {
        gaps_in     = 3,
        gaps_out    = 5,
        border_size = 1,
        col = {
            active_border   = cachywhite,
            inactive_border = cachymblue,
        },
        layout = "dwindle",
        snap = {
            enabled = true,
        },
    },

    group = {
        col = {
            border_active          = cachywhite,
            border_inactive        = cachymblue,
            border_locked_active   = cachywhite,
            border_locked_inactive = cachymblue,
        },
        groupbar = {
            font_size              = 12,
            font_family            = "monospace",
            font_weight_active     = "ultraheavy",
            font_weight_inactive   = "normal",
            indicator_height       = 0,
            indicator_gap          = 5,
            height                 = 22,
            gaps_in                = 5,
            gaps_out               = 0,
            text_color             = "rgb(ffffff)",
            text_color_inactive    = "rgba(ffffff90)",
            col = {
                active   = "rgba(00000080)",
                inactive = "rgba(00000040)",
            },
            gradients                 = true,
            gradient_rounding         = 0,
            gradient_round_only_edges = false,
        },
    },

    misc = {
        font_family           = "JetBrains Mono Nerd Font",
        splash_font_family    = "JetBrains Mono Nerd Font",
        disable_hyprland_logo = true,
        col                   = { splash = cachylgreen },
        background_color      = cachydblue,
        enable_swallow        = true,
        swallow_regex         = "^(nautilus|nemo|thunar|btrfs-assistant.)$",
        focus_on_activate     = true,
        vrr                   = 2,
    },

    render = {
        direct_scanout = true,
    },

    dwindle = {
        special_scale_factor = 0.8,
        preserve_split       = true,
        force_split          = 2,
    },

    master = {
        new_status           = "master",
        special_scale_factor = 0.8,
    },
})

-- Gestures
hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down",       action = "close" })
hl.gesture({ fingers = 3, direction = "up",         action = "fullscreen" })
hl.gesture({ fingers = 3, direction = "left",       action = "float" })
