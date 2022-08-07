local config = {}

function config.telescope()
    vim.cmd([[packadd sqlite.lua]])
    vim.cmd([[packadd telescope-fzf-native.nvim]])
    vim.cmd([[packadd telescope-project.nvim]])
    vim.cmd([[packadd telescope-frecency.nvim]])
    vim.cmd([[packadd telescope-zoxide]])
    require("telescope").setup({
        defaults = {
            initial_mode = "insert",
            prompt_prefix = "  ",
            selection_caret = " ",
            entry_prefix = " ",
            scroll_strategy = "limit",
            results_title = false,
            borderchars = {" ", " ", " ", " ", " ", " ", " ", " "},
            layout_strategy = "horizontal",
            path_display = {"absolute"},
            file_ignore_patterns = {},
            layout_config = {
                prompt_position = "bottom",
                horizontal = {preview_width = 0.5}
            },
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep
                .new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist
                .new,
            file_sorter = require("telescope.sorters").get_fuzzy_file,
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            mappings = {
                i = {
                    -- 上下移动
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                    -- 历史记录
                    ["<C-n>"] = "cycle_history_next",
                    ["<C-p>"] = "cycle_history_prev",
                    -- 关闭窗口
                    ["<C-c>"] = "close",
                    -- 预览窗口上下滚动
                    ["<C-u>"] = "preview_scrolling_up",
                    ["<C-d>"] = "preview_scrolling_down"
                }
            }

        },
        extensions = {
            fzf = {
                fuzzy = false,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case"
            },
            frecency = {
                show_scores = true,
                show_unindexed = true,
                ignore_patterns = {"*.git/*", "*/tmp/*"}
            },
            project = {
                base_dirs = {'~/go/src/code.byted.org/'},
                hidden_files = true
            }
        }

    })
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("project")
    require("telescope").load_extension("zoxide")
    require("telescope").load_extension("frecency")
end
function config.project()
    require("project_nvim").setup({
        detection_methods = {"pattern"},
        patterns = {
            ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json",
            ".sln", "go.mod", "go.sum"
        }
    })
end

function config.which_key()
    require("which-key").setup({
        plugins = {
            presets = {
                operators = false,
                motions = false,
                text_objects = false,
                windows = false,
                nav = false,
                z = true,
                g = true
            }
        },

        icons = {breadcrumb = "»", separator = "│", group = "+"},

        window = {
            border = "none",
            position = "bottom",
            margin = {1, 0, 1, 0},
            padding = {1, 1, 1, 1},
            winblend = 0
        }
    })
end

function config.wilder()
    vim.cmd([[
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('use_python_remote_plugin', 0)
call wilder#set_option('pipeline', [wilder#branch(
	\ wilder#cmdline_pipeline({'use_python': 0,'fuzzy': 1, 'fuzzy_filter': wilder#lua_fzy_filter()}),
	\ wilder#vim_search_pipeline(),
	\ [wilder#check({_, x -> empty(x)}), wilder#history(), wilder#result({'draw': [{_, x -> ' ' . x}]})]
	\ )])
call wilder#set_option('renderer', wilder#renderer_mux({
	\ ':': wilder#popupmenu_renderer({
		\ 'highlighter': wilder#lua_fzy_highlighter(),
		\ 'left': [wilder#popupmenu_devicons()],
		\ 'right': [' ', wilder#popupmenu_scrollbar()]
		\ }),
	\ '/': wilder#wildmenu_renderer({
		\ 'highlighter': wilder#lua_fzy_highlighter(),
		\ 'apply_incsearch_fix': v:true,
		\})
	\ }))
]])
end

function config.filetype()
    -- In init.lua or filetype.nvim's config file
    require("filetype").setup({
        overrides = {
            shebang = {
                -- Set the filetype of files with a dash shebang to sh
                dash = "sh"
            }
        }
    })
end

return config
