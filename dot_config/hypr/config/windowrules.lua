-- ======= Float Rules =======

hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" },                                         float = true })
hl.window_rule({ match = { class = "^()$", title = "^(Picture in picture)$" },                                  float = true })
hl.window_rule({ match = { class = "^()$", title = "^(Save File)$" },                                           float = true })
hl.window_rule({ match = { class = "^()$", title = "^(Open File)$" },                                           float = true })
hl.window_rule({ match = { class = "^(LibreWolf)$", title = "^(Picture-in-Picture)$" },                         float = true })
hl.window_rule({ match = { class = "^(blueman-manager)$" },                                                     float = true })
hl.window_rule({ match = { class = "^(xdg-desktop-portal-gtk|xdg-desktop-portal-kde|xdg-desktop-portal-hyprland)(.*)$" }, float = true })
hl.window_rule({ match = { class = "^(polkit-gnome-authentication-agent-1|hyprpolkitagent|org.org.kde.polkit-kde-authentication-agent-1)(.*)$" }, float = true })
hl.window_rule({ match = { class = "^(CachyOSHello)$" },                                                        float = true })
hl.window_rule({ match = { class = "^(zenity)$" },                                                              float = true })
hl.window_rule({ match = { class = "^()$", title = "^(Steam - Self Updater)$" },                                float = true })
hl.window_rule({ match = { title = "^(Picture-in-Picture)$" },                                                  float = true })
hl.window_rule({ match = { title = "^(imv|mpv|danmufloat|termfloat|nemo|ncmpcpp)$" },                          float = true })

-- ======= Opacity =======

hl.window_rule({ match = { class = "^(thunar|nemo)$" },                  opacity = 0.92 })
hl.window_rule({ match = { class = "^(discord|armcord|webcord)$" },      opacity = 0.96 })
hl.window_rule({ match = { title = "^(QQ|Telegram)$" },                  opacity = 0.95 })
hl.window_rule({ match = { title = "^(NetEase Cloud Music Gtk4)$" },     opacity = 0.95 })

-- ======= Size & Position =======

hl.window_rule({ match = { title = "^(Picture-in-Picture)$" },                         size = "960 540" })
hl.window_rule({ match = { title = "^(imv|mpv|danmufloat|termfloat|nemo|ncmpcpp)$" }, size = "960 540" })

-- ======= Pin =======

hl.window_rule({ match = { title = "^(danmufloat)$" }, pin = true })

-- ======= Rounding =======

hl.window_rule({ match = { title = "^(danmufloat|termfloat)$" }, rounding = 5 })

-- ======= Animation =======

hl.window_rule({ match = { class = "^(kitty|Alacritty)$" }, animation = "slide right" })

-- ======= Blur =======

hl.window_rule({ match = { class = "^(org.mozilla.firefox)$" }, no_blur = true })

-- ======= Floating Window Decorations =======

hl.window_rule({
    match        = { float = true, workspace = "w[fv1-10]" },
    border_size  = 2,
    border_color = cachylblue,
    rounding     = 8,
})

-- ======= Tiling Window Decorations =======

hl.window_rule({
    match       = { float = false, workspace = "f[1-10]" },
    border_size = 3,
    rounding    = 5,
})

-- ======= Workspace Rules =======

hl.workspace_rule({ workspace = "w[tv1-10]", gaps_out = 5, gaps_in = 3 })
hl.workspace_rule({ workspace = "f[1]",      gaps_out = 5, gaps_in = 3 })
