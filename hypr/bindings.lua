-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Omarchy Menus
hl.unbind("SUPER + SPACE")
o.bind("CTRL + SPACE", "Omarchy menu", "omarchy-menu toggle root")

hl.unbind("SUPER ALT + SPACE")
o.bind("ALT + SPACE", "Apps menu", "omarchy-menu toggle apps")

-- Control center leader: SUPER + SPACE, C, then an action key.
hl.unbind("SUPER + CTRL + W")
hl.unbind("SUPER + CTRL + A")
hl.unbind("SUPER + CTRL + B")
hl.unbind("SUPER + CTRL + D")
hl.unbind("SUPER + CTRL + ALT + B")
hl.unbind("SUPER + CTRL + P")
hl.unbind("SUPER + CTRL + V")
hl.unbind("SUPER + SHIFT + CTRL + A")
hl.unbind("SUPER + CTRL + T")

o.bind("SUPER + SPACE", "Leader", hl.dsp.submap("leader"))

hl.define_submap("leader", function()
	o.bind("c", "Control center", hl.dsp.submap("control-center"))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

local function control_center_action(command)
	return function()
		hl.exec_cmd(command)
		hl.dispatch(hl.dsp.submap("reset"))
	end
end

hl.define_submap("control-center", function()
	o.bind("n", "Network", control_center_action("omarchy-shell shell toggle omarchy.network"))
	o.bind("v", "Volume / Audio", control_center_action("omarchy-shell shell toggle omarchy.audio"))
	o.bind("d", "Display", control_center_action("omarchy-shell shell toggle omarchy.monitor"))
	o.bind("p", "Power", control_center_action("omarchy-shell shell toggle omarchy.power"))
	o.bind("b", "Bluetooth", control_center_action("omarchy-shell shell toggle omarchy.bluetooth"))
	o.bind("c", "Clipboard", control_center_action("omarchy-shell shell toggle io.github.vuhuy.clipboard-manager"))
	o.bind("a", "Agents", control_center_action("omarchy-shell shell toggle omarchy.agents"))
	o.bind("s", "Statistics / Activity", control_center_action("omarchy-shell shell toggle stappmus.activity-monitor"))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Grouping
for index = 1, 10 do
	hl.unbind("SUPER + ALT + code:" .. tostring(index + 9))
	o.bind(
		"ALT + code:" .. tostring(index + 9),
		"Switch to group window " .. index,
		hl.dsp.group.active({ index = index })
	)
end

-- previously: Music
hl.unbind("SUPER + SHIFT + M")
o.bind("SUPER + SHIFT + M", "Omarchy Spotify", "omarchy shell -q quickshell.spotify.player togglePlayer")

o.bind("SUPER + R", "VoxType Start", "voxtype record toggle")
