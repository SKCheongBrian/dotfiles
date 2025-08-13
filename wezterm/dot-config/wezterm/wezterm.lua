local wezterm = require('wezterm')

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end
config = require('colors/kanagawa-dragon')
config.font = wezterm.font {
  family = 'Google Sans Code',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
}
config.font_size = 15.0
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.keys = {
  {
    key = 'm',
    mods = 'CMD',
    action = wezterm.action.DisableDefaultAssignment,
  },
}
-- config.colors = theme.colors()

return config
