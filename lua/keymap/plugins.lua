local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

-- plugins map
local plugins_map = {
    -- Plugin nvim-tree
    ["n|<C-n>"] = map_cr("NvimTreeToggle"):with_noremap():with_silent(),
    ["n|<Leader>nf"] = map_cr("NvimTreeFindFile"):with_noremap():with_silent(),
    ["n|<Leader>nr"] = map_cr("NvimTreeRefresh"):with_noremap():with_silent(),
    -- Plugin Telescope
    ["n|<Leader>fp"] = map_cu(
        "lua require('telescope').extensions.project.project{}"):with_noremap()
        :with_silent(),
    ["n|<Leader>fr"] = map_cu(
        "lua require('telescope').extensions.frecency.frecency{}"):with_noremap()
        :with_silent(),
    ["n|<Leader>fe"] = map_cu("Telescope oldfiles"):with_noremap():with_silent(),
    ["n|<Leader>ff"] = map_cu("Telescope find_files"):with_noremap()
        :with_silent(),
    ["n|<Leader>sc"] = map_cu("Telescope colorscheme"):with_noremap()
        :with_silent(),
    ["n|<Leader>fn"] = map_cu(":enew"):with_noremap():with_silent(),
    ["n|<Leader>fw"] = map_cu("Telescope live_grep"):with_noremap()
        :with_silent(),
    ["n|<Leader>fg"] = map_cu("Telescope git_files"):with_noremap()
        :with_silent(),
    ["n|<Leader>fz"] = map_cu("Telescope zoxide list"):with_noremap()
        :with_silent()
}

return plugins_map
