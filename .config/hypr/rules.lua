--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    -- Discord's launcher hands off to a separate updater process, so exec rules
    -- (matched by PID) never reach its window. Match on class instead.
    name  = "discord-workspace",
    match = { class = "^discord$" },

    workspace = "4 silent",
})

-- Blur behind swaync and slide notifications in from the right edge
hl.layer_rule({
    name  = "swaync-blur",
    match = { namespace = "^swaync-(control-center|notification-window)$" },

    blur         = true,
    ignore_alpha = 0.5,
})

hl.layer_rule({
    name  = "swaync-slide",
    match = { namespace = "^swaync-(control-center|notification-window)$" },

    animation = "slide right",
})
