local ui = {}
local conf = require("modules.ui.config")

-- theme
ui["folke/tokyonight.nvim"] = { opt = false }

ui["kyazdani42/nvim-web-devicons"] = { opt = false }
ui["rcarriga/nvim-notify"] = { opt = false, config = conf.notify }
ui["hoob3rt/lualine.nvim"] = { opt = false, config = conf.lualine }
ui["arkav/lualine-lsp-progress"] = { opt = false }

ui["goolord/alpha-nvim"] = {
	opt = true,
	event = "BufWinEnter",
	config = conf.alpha,
}
ui["lewis6991/gitsigns.nvim"] = {
	opt = false,
	event = { "BufReadPost", "BufNewFile" },
	config = conf.gitsigns,
	requires = { "nvim-lua/plenary.nvim", opt = true },
}
ui["lukas-reineke/indent-blankline.nvim"] = {
	opt = false,
	event = "BufReadPost",
	config = conf.indent_blankline,
}
ui["akinsho/bufferline.nvim"] = {
	opt = false,
	tag = "*",
	event = "BufReadPost",
	config = conf.nvim_bufferline,
}
ui["kyazdani42/nvim-tree.lua"] = {
	opt = false,
	cmd = { "NvimTreeToggle" },
	config = conf.nvim_tree,
}
ui["mbbill/undotree"] = { opt = true, cmd = "UndotreeToggle" }
ui["j-hui/fidget.nvim"] = {
	opt = true,
	event = "BufReadPost",
	config = conf.fidget,
}

return ui
