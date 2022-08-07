local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

-- plugins map
local plugins_map = {
    -- Bufferline
    ["n|gb"] = map_cr("BufferLinePick"):with_noremap():with_silent(),
    ["n|<M-j>"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent(),
    ["n|<M-k>"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent(),
    ["n|<M-S-j>"] = map_cr("BufferLineMoveNext"):with_noremap():with_silent(),
    ["n|<M-S-k>"] = map_cr("BufferLineMovePrev"):with_noremap():with_silent(),
    ["n|<leader>be"] = map_cr("BufferLineSortByExtension"):with_noremap(),
    ["n|<leader>bd"] = map_cr("BufferLineSortByDirectory"):with_noremap(),
    ["n|<A-1>"] = map_cr("BufferLineGoToBuffer 1"):with_noremap():with_silent(),
    ["n|<A-2>"] = map_cr("BufferLineGoToBuffer 2"):with_noremap():with_silent(),
    ["n|<A-3>"] = map_cr("BufferLineGoToBuffer 3"):with_noremap():with_silent(),
    ["n|<A-4>"] = map_cr("BufferLineGoToBuffer 4"):with_noremap():with_silent(),
    ["n|<A-5>"] = map_cr("BufferLineGoToBuffer 5"):with_noremap():with_silent(),
    ["n|<A-6>"] = map_cr("BufferLineGoToBuffer 6"):with_noremap():with_silent(),
    ["n|<A-7>"] = map_cr("BufferLineGoToBuffer 7"):with_noremap():with_silent(),
    ["n|<A-8>"] = map_cr("BufferLineGoToBuffer 8"):with_noremap():with_silent(),
    ["n|<A-9>"] = map_cr("BufferLineGoToBuffer 9"):with_noremap():with_silent(),
    -- Lsp mapp work when insertenter and lsp start
    ["n|<leader>li"] = map_cr("LspInfo"):with_noremap():with_silent()
        :with_nowait(),
    ["n|<leader>lr"] = map_cr("LspRestart"):with_noremap():with_silent()
        :with_nowait(),
    ["n|g["] = map_cr("Lspsaga diagnostic_jump_next"):with_noremap()
        :with_silent(),
    ["n|g]"] = map_cr("Lspsaga diagnostic_jump_prev"):with_noremap()
        :with_silent(),
    ["n|gs"] = map_cr("Lspsaga signature_help"):with_noremap():with_silent(),
    ["n|gr"] = map_cr("Lspsaga rename"):with_noremap():with_silent(),
    ["n|K"] = map_cr("Lspsaga hover_doc"):with_noremap():with_silent(),
    ["n|<C-Up>"] = map_cr(
        "lua require('lspsaga.action').smart_scroll_with_saga(-1)"):with_noremap()
        :with_silent(),
    ["n|<C-Down>"] = map_cr(
        "lua require('lspsaga.action').smart_scroll_with_saga(1)"):with_noremap()
        :with_silent(),
    ["n|<leader>ca"] = map_cr("Lspsaga code_action"):with_noremap()
        :with_silent(),
    ["v|<leader>ca"] = map_cu("Lspsaga range_code_action"):with_noremap()
        :with_silent(),
    ["n|gd"] = map_cr("Lspsaga preview_definition"):with_noremap():with_silent(),
    ["n|gD"] = map_cr("lua vim.lsp.buf.definition()"):with_noremap()
        :with_silent(),
    ["n|gh"] = map_cr("lua vim.lsp.buf.references()"):with_noremap()
        :with_silent(),
    ["n|<Leader>G"] = map_cu("Git"):with_noremap():with_silent(),
    ["n|gps"] = map_cr("G push"):with_noremap():with_silent(),
    ["n|gpl"] = map_cr("G pull"):with_noremap():with_silent(),
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
    -- Plugin vim-eft
    ["n|f"] = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["n|F"] = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    ["n|t"] = map_cmd("v:lua.enhance_ft_move('t')"):with_expr(),
    ["n|T"] = map_cmd("v:lua.enhance_ft_move('T')"):with_expr(),
    ["n|;"] = map_cmd("v:lua.enhance_ft_move(';')"):with_expr(),
    -- Plugin auto_session
    ["n|<leader>ss"] = map_cu("SaveSession"):with_noremap():with_silent(),
    ["n|<leader>sr"] = map_cu("RestoreSession"):with_noremap():with_silent(),
    ["n|<leader>sd"] = map_cu("DeleteSession"):with_noremap():with_silent(),
    -- Plugin Diffview
    ["n|<leader>D"] = map_cr("DiffviewOpen"):with_silent():with_noremap(),
    ["n|<leader><leader>D"] = map_cr("DiffviewClose"):with_silent()
        :with_noremap(),
    -- Plugin Tabout
    ["i|<A-l>"] = map_cmd([[<Plug>(TaboutMulti)]]):with_silent(),
    ["i|<A-h>"] = map_cmd([[<Plug>(TaboutBackMulti)]]):with_silent()
}

return plugins_map
