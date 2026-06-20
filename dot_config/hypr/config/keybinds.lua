local mainMod = "SUPER"

-- ======= Application Launchers =======

hl.bind("ALT + RETURN", hl.dsp.exec_cmd(terminal),  { desc = "Open terminal" })
hl.bind("ALT + B",      hl.dsp.exec_cmd(browser),   { desc = "Open browser" })
hl.bind("ALT + M",      hl.dsp.exec_cmd(music),     { desc = "Open music player" })
hl.bind("ALT + T",      hl.dsp.exec_cmd(terminal .. " -e btop"), { desc = "Open btop" })
hl.bind("ALT + SPACE",  hl.dsp.exec_cmd(applauncher), { desc = "Open app launcher" })
hl.bind("ALT + Q",      hl.dsp.window.close(),       { desc = "Close window" })

hl.bind("ALT + D", function() hl.exec_cmd("discord",      { workspace = "4" }) end, { desc = "Open Discord" })
hl.bind("ALT + S", function() hl.exec_cmd("slack",        { workspace = "4" }) end, { desc = "Open Slack" })
hl.bind("ALT + V", function() hl.exec_cmd("virt-manager", { workspace = "5" }) end, { desc = "Open Virt Manager" })

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(filemanager),                              { desc = "Open file manager" })
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd('loginctl terminate-user ""'),    { desc = "Exit Hyprland" })
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }),                { desc = "Toggle floating" })
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(),                                { desc = "Toggle fullscreen" })
hl.bind(mainMod .. " + Y", hl.dsp.window.pin(),                                       { desc = "Pin window" })
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"),                              { desc = "Toggle split" })

-- ======= Screenshots =======

hl.bind("Print",       hl.dsp.exec_cmd(shot_region), { desc = "Screenshot region" })
hl.bind("CTRL + Print", hl.dsp.exec_cmd(shot_window), { desc = "Screenshot window" })
hl.bind("ALT + Print", hl.dsp.exec_cmd(shot_screen),  { desc = "Screenshot screen" })

-- ======= Grouping =======

hl.bind(mainMod .. " + K",   hl.dsp.group.toggle(), { desc = "Toggle group" })
hl.bind(mainMod .. " + Tab", hl.dsp.group.next(),   { desc = "Next in group" })

-- ======= Gap Toggles =======

hl.bind(mainMod .. " + SHIFT + G", function()
    hl.config({ general = { gaps_out = 5, gaps_in = 3 } })
end, { desc = "Set default gaps" })

hl.bind(mainMod .. " + G", function()
    hl.config({ general = { gaps_out = 0, gaps_in = 0 } })
end, { desc = "Remove gaps" })

-- ======= Volume Control =======

hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd([[pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{if($1>100) system("pactl set-sink-volume @DEFAULT_SINK@ 100%")}' && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]]),
    { repeating = true })

hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd([[pactl set-sink-volume @DEFAULT_SINK@ -5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]]),
    { repeating = true })

hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd([[amixer sset Master toggle | sed -En '/\[on\]/ s/.*\[([0-9]+)%\].*/\1/ p; /\[off\]/ s/.*/0/p' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]]),
    { repeating = true })

-- ======= Playback Control =======

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- ======= Screen Brightness =======

hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s +5%"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true })

hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("swaylock-fancy -e -K -p 10 -f Hack-Regular"), { desc = "Lock screen" })
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"),                     { desc = "Reload Waybar" })

-- ======= Window Focus =======

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- ======= Window Move =======

hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

hl.bind("ALT + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("ALT + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ======= Window Resize =======

-- Resize submap
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"), { desc = "Enter resize mode" })

hl.define_submap("resize", function()
    hl.bind("right",  hl.dsp.window.resize(), {15,  0})
    hl.bind("left",   hl.dsp.window.resize(), {-15,  0})
    hl.bind("up",     hl.dsp.window.resize(), {0, -15})
    hl.bind("down",   hl.dsp.window.resize(), {0, 15})
    hl.bind("l",      hl.dsp.window.resize(), {15,  0})
    hl.bind("h",      hl.dsp.window.resize(), {-15,  0})
    hl.bind("k",      hl.dsp.window.resize(), {0, -15})
    hl.bind("j",      hl.dsp.window.resize(), {0, 15})
    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Quick resize without submap
hl.bind(mainMod .. " + CTRL + SHIFT + right", hl.dsp.window.resize(), { 15,  0})
hl.bind(mainMod .. " + CTRL + SHIFT + left",  hl.dsp.window.resize(), {-15,  0})
hl.bind(mainMod .. " + CTRL + SHIFT + up",    hl.dsp.window.resize(), {  0,-15})
hl.bind(mainMod .. " + CTRL + SHIFT + down",  hl.dsp.window.resize(), {  0, 15})
hl.bind(mainMod .. " + CTRL + SHIFT + l",     hl.dsp.window.resize(), { 15,  0})
hl.bind(mainMod .. " + CTRL + SHIFT + h",     hl.dsp.window.resize(), {-15,  0})
hl.bind(mainMod .. " + CTRL + SHIFT + k",     hl.dsp.window.resize(), {  0,-15})
hl.bind(mainMod .. " + CTRL + SHIFT + j",     hl.dsp.window.resize(), {  0, 15})

-- ======= Workspaces =======

for i = 1, 10 do
    local key = tostring(i % 10)
    hl.bind(mainMod .. " + " .. key,           hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + CTRL + " .. key,    hl.dsp.window.move({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,   hl.dsp.window.move({ workspace = i, silent = true }))
end

hl.bind(mainMod .. " + PERIOD",     hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + COMMA",      hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + slash",      hl.dsp.focus({ workspace = "previous" }))

hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ workspace = "+1" }))

-- Special workspaces
hl.bind(mainMod .. " + minus",              hl.dsp.window.move({ workspace = "special" }))
hl.bind(mainMod .. " + equal",              hl.dsp.workspace.toggle_special("special"))
hl.bind(mainMod .. " + F1",                 hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mainMod .. " + ALT + SHIFT + F1",   hl.dsp.window.move({ workspace = "special:scratchpad", silent = true }))

-- ======= Binds Settings =======

hl.config({
    binds = {
        allow_workspace_cycles            = true,
        workspace_back_and_forth          = true,
        workspace_center_on               = 1,
        movefocus_cycles_fullscreen       = true,
        window_direction_monitor_fallback = true,
    },
})
