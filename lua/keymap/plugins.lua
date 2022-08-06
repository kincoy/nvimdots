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
        :with_silent(),
    -- Plugin Hop
    ["n|<leader>c"] = map_cu("HopChar1"):with_noremap(),
    ["n|<leader>cc"] = map_cu("HopChar2"):with_noremap(),
    -- Plugin EasyAlign
    ["n|ga"] = map_cmd("v:lua.enhance_align('nga')"):with_expr(),
    ["x|ga"] = map_cmd("v:lua.enhance_align('xga')"):with_expr(),
    -- Plugin accelerate-jk
    ["n|j"] = map_cmd("v:lua.enhance_jk_move('j')"):with_silent():with_expr(),
    ["n|k"] = map_cmd("v:lua.enhance_jk_move('k')"):with_silent():with_expr(),
    -- Plugin auto_session
    ["n|<leader>ss"] = map_cu("SaveSession"):with_noremap():with_silent(),
    ["n|<leader>sr"] = map_cu("RestoreSession"):with_noremap():with_silent(),
    ["n|<leader>sd"] = map_cu("DeleteSession"):with_noremap():with_silent(),
    -- Plugin Diffview
    ["n|<leader>D"] = map_cr("DiffviewOpen"):with_silent():with_noremap(),
    ["n|<leader><leader>D"] = map_cr("DiffviewClose"):with_silent()
        :with_noremap()
}

return plugins_map
