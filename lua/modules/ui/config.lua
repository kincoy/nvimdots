local config = {}
function config.alpha()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")

	dashboard.section.header.val = {
		[[　　　 　　/＾>》, -―‐‐＜＾}]],
		[[　　　 　./:::/,≠´::::::ヽ.]],
		[[　　　　/::::〃::::／}::丿ハ]],
		[[　　　./:::::i{l|／　ﾉ／ }::}]],
		[[　　 /:::::::瓜イ＞　´＜ ,:ﾉ]],
		[[　 ./::::::|ﾉﾍ.{､　(_ﾌ_ノﾉイ＿]],
		[[　 |:::::::|／}｀ｽ /          /]],
		[[.　|::::::|(_:::つ/    Mac   /　neovim!]],
		[[.￣￣￣￣￣￣￣＼/＿＿＿＿＿/￣￣￣￣￣]],
	}

	local function button(sc, txt, leader_txt, keybind, keybind_opts)
		local sc_after = sc:gsub("%s", ""):gsub(leader_txt, "<leader>")

		local opts = {
			position = "center",
			shortcut = sc,
			cursor = 5,
			width = 50,
			align_shortcut = "right",
			hl_shortcut = "Keyword",
		}

		if nil == keybind then
			keybind = sc_after
		end
		keybind_opts = vim.F.if_nil(keybind_opts, {
			noremap = true,
			silent = true,
			nowait = true,
		})
		opts.keymap = { "n", sc_after, keybind, keybind_opts }

		local function on_press()
			-- local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
			local key = vim.api.nvim_replace_termcodes(sc_after .. "<Ignore>", true, false, true)
			vim.api.nvim_feedkeys(key, "t", false)
		end

		return { type = "button", val = txt, on_press = on_press, opts = opts }
	end

	local leader = "comma"
	dashboard.section.buttons.val = {
		button("comma f p", " Project find", leader, "<cmd>Telescope project<cr>"),
		button("comma f f", " File find", leader, "<cmd>Telescope find_files<cr>"),
		button("comma f n", " File new", leader, "<cmd>enew<cr>"),
		button("comma f w", " Word find", leader, "<cmd>Telescope live_grep<cr>"),
	}
	dashboard.section.buttons.opts.hl = "String"

	local function footer()
		local total_plugins = #vim.tbl_keys(packer_plugins)
		return
			"   Have Fun with neovim"
				.. "   v"
				.. vim.version().major
				.. "."
				.. vim.version().minor
				.. "."
				.. vim.version().patch
				.. "   "
				.. total_plugins
				.. " plugins"
	end

	dashboard.section.footer.val = footer()
	dashboard.section.footer.opts.hl = "Function"

	local head_butt_padding = 2
	local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
	local header_padding = math.max(0, math.ceil((vim.fn.winheight("$") - occu_height) * 0.25))
	local foot_butt_padding = 1

	dashboard.config.layout = {
		{ type = "padding", val = header_padding },
		dashboard.section.header,
		{ type = "padding", val = head_butt_padding },
		dashboard.section.buttons,
		{ type = "padding", val = foot_butt_padding },
		dashboard.section.footer,
	}

	alpha.setup(dashboard.opts)
end

function config.lualine()
	require("lualine").setup({
		options = {
			theme = "tokyonight",
			component_separators = { left = "|", right = "|" },
			section_separators = { left = " ", right = "" },
		},
		extensions = { "nvim-tree", "toggleterm" },
		sections = {
			lualine_c = {
				"filename",
				{
					"lsp_progress",
					spinner_symbols = {
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
					},
				},
			},
			lualine_x = {
				"filesize",
				{
					"fileformat",
					-- symbols = {
					--   unix = '', -- e712
					--   dos = '', -- e70f
					--   mac = '', -- e711
					-- },
					symbols = { unix = "LF", dos = "CRLF", mac = "CR" },
				},
				"encoding",
				"filetype",
			},
		},
	})
end

function config.notify()
	local notify = require("notify")
	notify.setup({})

	vim.notify = notify
end

function config.nvim_tree()
	require("nvim-tree").setup({
		git = { enable = true },
		respect_buf_cwd = true,
		auto_reload_on_write = true,
		update_cwd = true,
		update_focused_file = { enable = true, update_cwd = true },
		view = {
			width = 30,
			side = "left",
			number = false,
			relativenumber = false,
			signcolumn = "yes",
			hide_root_folder = false,
			mappings = {
				custom_only = false,
				list = {
					{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
					{ key = "v", action = "vsplit" },
					{ key = "h", action = "split" },
					{ key = "a", action = "create" },
					{ key = "d", action = "remove" },
					{ key = "r", action = "rename" },
				},
			},
		},
		filters = { dotfiles = false, custom = { ".DS_Store" }, exclude = {} },
		actions = { open_file = { quit_on_open = false, resize_window = false } },
	})
end

function config.nvim_bufferline()
	require("bufferline").setup({
		options = {
			close_command = "Bdelete! %d",
			right_mouse_command = "Bdelete! %d",
			show_buffer_icons = true,
			diagnostics = "nvim_lsp",
			always_show_bufferline = true,
			separator_style = "thin",
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
					padding = 1,
				},
			},
		},
	})
end

function config.gitsigns()
	require("gitsigns").setup({
		signs = {
			add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
			change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
			delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
			topdelete = {
				hl = "GitSignsDelete",
				text = "‾",
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			changedelete = {
				hl = "GitSignsChange",
				text = "~",
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
		},
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},
		attach_to_untracked = true,
		current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 40000, -- Disable if file is longer than this (in lines)
		preview_config = {
			-- Options passed to nvim_open_win
			border = "single",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
		yadm = {
			enable = false,
		},
	})
end
function config.indent_blankline()
	require("indent_blankline").setup({
		char = "│",
		show_first_indent_level = true,
		filetype_exclude = {
			"startify",
			"dashboard",
			"dotooagenda",
			"log",
			"fugitive",
			"gitcommit",
			"packer",
			"vimwiki",
			"markdown",
			"json",
			"txt",
			"vista",
			"help",
			"todoist",
			"NvimTree",
			"peekaboo",
			"git",
			"TelescopePrompt",
			"undotree",
			"flutterToolsOutline",
			"", -- for all buffers without a file type
		},
		buftype_exclude = { "terminal", "nofile" },
		show_trailing_blankline_indent = false,
		show_current_context = true,
		context_patterns = {
			"class",
			"function",
			"method",
			"block",
			"list_literal",
			"selector",
			"^if",
			"^table",
			"if_statement",
			"while",
			"for",
			"type",
			"var",
			"import",
		},
		space_char_blankline = " ",
	})
	-- because lazy load indent-blankline so need readd this autocmd
	vim.cmd("autocmd CursorMoved * IndentBlanklineRefresh")
end

function config.fidget()
	require("fidget").setup({})
end

return config
