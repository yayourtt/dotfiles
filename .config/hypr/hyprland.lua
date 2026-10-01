-- Hyprland config entry point.
-- Refer to the wiki for more information: https://wiki.hypr.land/Configuring/Start/
--
-- Each setting lives in exactly one of the files required at the bottom,
-- so change it there instead of overriding it here.


------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------
---- MODULES ----
-----------------

require("look")      -- gaps, borders, opacity, blur, animations, layouts
require("input")     -- keyboard, mouse, touchpad, gestures
require("binds")     -- programs and keybindings
require("rules")     -- window and workspace rules
require("autostart") -- programs launched with Hyprland
