local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

-- plugins map
local plugins_map = {
    -- Plugin nvim-tree
    ["n|<C-n>"] = map_cr("NvimTreeToggle"):with_noremap():with_silent(),
    ["n|<Leader>nf"] = map_cr("NvimTreeFindFile"):with_noremap():with_silent(),
    ["n|<Leader>nr"] = map_cr("NvimTreeRefresh"):with_noremap():with_silent()
}

return plugins_map
