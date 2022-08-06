local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
require("keymap.config")

default_map = require("keymap.default")
plugins_map = require("keymap.plugins")

bind.nvim_load_mapping(default_map)
bind.nvim_load_mapping(plugins_map)
