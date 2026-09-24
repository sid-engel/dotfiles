-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

hl.env("GDK_SCALE", "1.25")

-- Laptop + two externals, left to right.
hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-2", mode = "1920x1080@60", position = "1920x0", scale = 1 })
hl.monitor({ output = "DP-3", mode = "1920x1080@60", position = "3840x0", scale = 1 })

-- Anything else (projectors, docks on other ports).
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })
