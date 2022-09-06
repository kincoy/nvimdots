local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local vim = vim

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.enhance_jk_move = function(key)
	local map = key == "j" and "<Plug>(accelerated_jk_gj)" or "<Plug>(accelerated_jk_gk)"
	return t(map)
end

_G.enhance_ft_move = function(key)
	local map = {
		f = "<Plug>(eft-f)",
		F = "<Plug>(eft-F)",
		t = "<Plug>(eft-t)",
		T = "<Plug>(eft-T)",
		[";"] = "<Plug>(eft-repeat)",
	}
	return t(map[key])
end

_G.enhance_align = function(key)
	vim.cmd([[packadd vim-easy-align]])
	local map = { ["nga"] = "<Plug>(EasyAlign)", ["xga"] = "<Plug>(EasyAlign)" }
	return t(map[key])
end

-- plugins map
local plugins_map = {
	-- Bufferline
	["n|<C-.>"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent(),
	["n|<C-,>"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent(),
	-- Lsp mapp work when insertenter and lsp start
	["n|g["] = map_cr("Lspsaga diagnostic_jump_next"):with_noremap():with_silent(),
	["n|g]"] = map_cr("Lspsaga diagnostic_jump_prev"):with_noremap():with_silent(),
	["n|gs"] = map_cr("Lspsaga signature_help"):with_noremap():with_silent(),
	["n|<leader>rn"] = map_cr("Lspsaga rename"):with_noremap():with_silent(),
	["n|K"] = map_cr("Lspsaga hover_doc"):with_noremap():with_silent(),
	["n|<leader>ca"] = map_cr("Lspsaga code_action"):with_noremap():with_silent(),
	["v|<leader>ca"] = map_cu("Lspsaga range_code_action"):with_noremap():with_silent(),
	["n|gd"] = map_cr("Lspsaga preview_definition"):with_noremap():with_silent(),
	["n|gD"] = map_cr("lua vim.lsp.buf.definition()"):with_noremap():with_silent(),
	["n|gr"] = map_cr("lua vim.lsp.buf.references()"):with_noremap():with_silent(),
	["n|gi"] = map_cr("lua vim.lsp.buf.implementation()"):with_noremap():with_silent(),
	["n|<Leader>G"] = map_cu("Git"):with_noremap():with_silent(),
	-- Plugin nvim-tree
	["n|<C-n>"] = map_cr("NvimTreeToggle"):with_noremap():with_silent(),
	-- Plugin Aerial
	["n|<leader>at"] = map_cr("AerialToggle! right"):with_noremap():with_silent(),
	-- Plugin Undotree
	["n|<Leader>u"] = map_cr("UndotreeToggle"):with_noremap():with_silent(),
	-- Plugin Telescope
	["n|<Leader>fp"] = map_cu("lua require('telescope').extensions.project.project{}"):with_noremap():with_silent(),
	["n|<Leader>fe"] = map_cu("Telescope oldfiles"):with_noremap():with_silent(),
	["n|<Leader>ff"] = map_cu("Telescope find_files"):with_noremap():with_silent(),
	["n|<Leader>fc"] = map_cu("Telescope colorscheme"):with_noremap():with_silent(),
	["n|<Leader>fn"] = map_cu(":enew"):with_noremap():with_silent(),
	["n|<Leader>fw"] = map_cu("Telescope live_grep"):with_noremap():with_silent(),
	["n|<Leader>fb"] = map_cu("Telescope buffers"):with_noremap():with_silent(),
	["n|<Leader>fg"] = map_cu("Telescope git_files"):with_noremap():with_silent(),
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
	-- Plugin auto_session
	["n|<leader>ss"] = map_cu("SaveSession"):with_noremap():with_silent(),
	["n|<leader>sr"] = map_cu("RestoreSession"):with_noremap():with_silent(),
	["n|<leader>sd"] = map_cu("DeleteSession"):with_noremap():with_silent(),
	-- Plugin Diffview
	["n|<leader>D"] = map_cr("DiffviewOpen"):with_silent():with_noremap(),
	["n|<leader><leader>D"] = map_cr("DiffviewClose"):with_silent():with_noremap(),
	-- Plugin BuffDelete
	["n|<C-w>"] = map_cr("Bdelete!"):with_noremap():with_silent(),
}

return plugins_map
