
-- WezTerm reads this file on launch and again every time you save it.
local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- ---------------------------------------------------------------
-- Appearance
-- ---------------------------------------------------------------
config.color_scheme = "Everforest Dark Hard (Gogh)"
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 18.0
config.line_height = 1.1

config.window_decorations = "RESIZE" -- no title bar, still resizable
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.8 -- slightly see-through
config.macos_window_background_blur = 15 -- blur what shows through (macOS only)
config.window_padding = { left = "1cell", right = "1cell", top = "0.5cell", bottom = "0.5cell" }
config.initial_cols = 200
config.initial_rows = 60

-- Dim the panes you are not typing in, so focus is always obvious
config.inactive_pane_hsb = { saturation = 0.9, brightness = 0.6 }

config.default_cursor_style = "SteadyBar" -- thin line cursor that does not blink
config.animation_fps = 120 -- smoother animations on high-refresh screens
config.scrollback_lines = 10000

-- ---------------------------------------------------------------
-- Layout: Neovim on the left, Claude Code on the right
-- ---------------------------------------------------------------
local function ai_layout(_, pane)
  local right = pane:split({ direction = "Right", size = 0.4 })
  pane:send_text("nvim\n")
  -- wait a moment so Neovim is up before Claude looks for it
  right:send_text("sleep 1; claude --ide\n")
end

-- ---------------------------------------------------------------
-- Keys.  CMD = Command, ALT = Option.
-- ---------------------------------------------------------------
config.keys = {
  -- panes: split, zoom, close
  { key = "s", mods = "ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "v", mods = "ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "z", mods = "ALT", action = act.TogglePaneZoomState },
  { key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = false }) },

  -- panes: move focus
  { key = "h", mods = "CMD", action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = "CMD", action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "CMD", action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = "CMD", action = act.ActivatePaneDirection("Right") },

  -- panes: resize
  { key = "h", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
  { key = "j", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
  { key = "k", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
  { key = "l", mods = "CMD|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },

  -- tabs
  { key = "t", mods = "CMD", action = act.SpawnTab("CurrentPaneDomain") },
  { key = "[", mods = "CMD", action = act.ActivateTabRelative(-1) },
  { key = "]", mods = "CMD", action = act.ActivateTabRelative(1) },

  -- workflow
  { key = "d", mods = "CMD|SHIFT", action = wezterm.action_callback(ai_layout) },
  {
    key = "n",
    mods = "CMD|SHIFT",
    action = act.SwitchToWorkspace({ name = "notes", spawn = { cwd = wezterm.home_dir .. "/vault" } }),
  },
  { key = "s", mods = "CMD|SHIFT", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
}

return config
