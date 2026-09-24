-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

------------------------------------------------------------------------------
-- Strip Omarchy defaults that clash with Sid's layout
------------------------------------------------------------------------------

for _, keys in ipairs({
  "SUPER + SPACE",
  "SUPER + ALT + SPACE",
  "SHIFT + ALT + L",
  "SUPER + W",
  "SUPER + LEFT",
  "SUPER + RIGHT",
  "SUPER + UP",
  "SUPER + DOWN",
  "SUPER + ALT + F",
  "SUPER + ESCAPE",
  "SUPER + T",
  "SUPER + G",
  "SUPER + F",
}) do
  hl.unbind(keys)
end

for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  hl.unbind("SUPER + " .. key)
  hl.unbind("SUPER + SHIFT + " .. key)
end

------------------------------------------------------------------------------
-- SID'S BINDS
-- Modifier: ALT (no conflicts with Omarchy's SUPER binds)
------------------------------------------------------------------------------

local mod = "ALT"

-- Core app launches
o.bind(mod .. " + Q", "Close window", hl.dsp.window.close())
o.bind(mod .. " + T", "Terminal", { omarchy = "terminal" })
o.bind(mod .. " + S", "Omarchy menu", "omarchy-menu toggle")
o.bind(mod .. " + W", "Firefox", "firefox")
o.bind(mod .. " + F", "File manager", { launch = "nautilus --new-window" })
o.bind(mod .. " + O", "Obsidian", { launch = "obsidian" })
o.bind(mod .. " + M", "Omarchy Spotify", "omarchy shell -q quickshell.spotify.player toggleFullPlayer")
o.bind(mod .. " + ESCAPE", "Lock system", "omarchy-system-lock")

-- Dictation (push-to-talk: hold to record, release to transcribe)
o.bind(mod .. " + D", "Start dictation (push-to-talk)", "voxtype record start")
o.bind(mod .. " + D", "Stop dictation (push-to-talk)", "voxtype record stop", { release = true })

-- Toggle float + center current window
o.bind(mod .. " + I", "Toggle float + center", function()
  hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
  hl.dispatch(hl.dsp.window.center())
end)

-- Focus movement (HJKL)
o.bind(mod .. " + H", "Focus left", hl.dsp.focus({ direction = "l" }))
o.bind(mod .. " + J", "Focus right", hl.dsp.focus({ direction = "r" }))
o.bind(mod .. " + K", "Focus up", hl.dsp.focus({ direction = "u" }))
o.bind(mod .. " + L", "Focus down", hl.dsp.focus({ direction = "d" }))

-- Workspace switching / move window to workspace
for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  o.bind(mod .. " + " .. key, "Switch to workspace " .. workspace, hl.dsp.focus({ workspace = tostring(workspace) }))
  o.bind(mod .. " + SHIFT + " .. key, "Move window to workspace " .. workspace, hl.dsp.window.move({ workspace = tostring(workspace) }))
end
