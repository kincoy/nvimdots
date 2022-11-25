require("keymap.config")

local bind = require("keymap.bind")
local default_map = require("keymap.default")
local plugins_map = require("keymap.plugins")

bind.nvim_load_mapping(default_map)
bind.nvim_load_mapping(plugins_map)
