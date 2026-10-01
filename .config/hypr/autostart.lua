-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
    -- Desktop services
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("nm-applet --indicator")

    -- Clipboard history
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Apps
    hl.exec_cmd("kitty")
    hl.exec_cmd("discord") -- placed on workspace 4 by the discord-workspace window rule
    hl.exec_cmd("firefox --new-window https://outlook.office.com/calendar/", {workspace = "5 silent"})
end)
