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

return config
