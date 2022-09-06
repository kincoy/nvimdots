local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

-- default map
local def_map = {
	-- Vim map
	["n|s"] = map_cmd(""):with_noremap():with_silent(),
	["n|sv"] = map_cr("vsp"),
	["n|sh"] = map_cr("sp"),
	["n|sc"] = map_cmd("<C-w>c"),
	["n|so"] = map_cmd("<C-w>o"),
	["n|<leader>t"] = map_cr("sp | terminal"):with_noremap():with_silent(),
	["n|<leader>vt"] = map_cr("vsp | terminal"):with_noremap():with_silent(),
	["t|<ESC>"] = map_cr("<C-\\><C-n>"):with_noremap():with_silent(),
	["n|<C-s>"] = map_cu("write"):with_noremap(),
	["n|Y"] = map_cmd("y$"),
	["n|yy"] = map_cmd("0y$"),
	["n|D"] = map_cmd("d$"),
	["n|o"] = map_cmd("o<Esc>"),
	["n|O"] = map_cmd("O<Esc>"),
	["n|n"] = map_cmd("nzz"):with_noremap(),
	["n|N"] = map_cmd("Nzz"):with_noremap(),
	["n|<C-h>"] = map_cmd("<C-w>h"):with_noremap(),
	["n|<C-l>"] = map_cmd("<C-w>l"):with_noremap(),
	["n|<C-j>"] = map_cmd("<C-w>j"):with_noremap(),
	["n|<C-k>"] = map_cmd("<C-w>k"):with_noremap(),
	["n|<C-d>"] = map_cmd("12j"):with_noremap(),
	["n|<C-u>"] = map_cmd("12k"):with_noremap(),
	["n|s["] = map_cr("vertical resize -5"):with_silent(),
	["n|s]"] = map_cr("vertical resize +5"):with_silent(),
	["n|s;"] = map_cr("resize -2"):with_silent(),
	["n|s'"] = map_cr("resize +2"):with_silent(),
	["n|s="] = map_cmd("<C-w>="),
	["n|<C-q>"] = map_cr("wq"),
	["n|<leader>,"] = map_cr("nohlsearch"):with_noremap():with_silent(),
	-- Insert
	["i|jj"] = map_cmd("<Esc>"),
	["i|<C-a>"] = map_cmd("<ESC>^i"):with_noremap(),
	["i|<C-s>"] = map_cmd("<Esc>:w<CR>"),
	["i|<C-q>"] = map_cmd("<Esc>:wq<CR>"),
	-- command line
	["c|<C-b>"] = map_cmd("<Left>"):with_noremap(),
	["c|<C-f>"] = map_cmd("<Right>"):with_noremap(),
	["c|<C-a>"] = map_cmd("<Home>"):with_noremap(),
	["c|<C-k>"] = map_cmd("<End>"):with_noremap(),
	["c|<C-d>"] = map_cmd("<Del>"):with_noremap(),
	["c|<C-h>"] = map_cmd("<BS>"):with_noremap(),
	["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(),
	["c|w!!"] = map_cmd("execute 'silent! write !sudo tee % >/dev/null' <bar> edit!"),
	-- Visual
	["v|J"] = map_cmd(":m '>+1<cr>gv=gv"),
	["v|K"] = map_cmd(":m '<-2<cr>gv=gv"),
	["v|<"] = map_cmd("<gv"),
	["v|>"] = map_cmd(">gv"),
	["v|<C-c>"] = map_cmd('"+y'):with_noremap():with_silent(),
}

return def_map
