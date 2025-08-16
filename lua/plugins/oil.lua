return {
    {
        "stevearc/oil.nvim",
        --dependencies = { { "echasnovski/mini.icons", opts = {} } },
        dependencies = { "nvim-tree/nvim-web-devicons"},
        lazy = false,
        config = function()
            require("oil").setup({
                default_file_explorer = true,
                columns = { "icon"},
                delete_to_trash = true,
                preview = { update_on_cursor_moved = true },
                view_options = { show_hidden = true },

                -- floating window-config
                float = {
                    padding = 2,	
                    max_width = 0.8,
                    max_height = 0.8, 
                    border = "rounded",
                    win_options = {
                        winblend = 0,
                    },
                    override = function(conf)
                        return conf
                    end,
                }
            })

            -- oil keybindings
            vim.keymap.set("n", "-", function()
                require("oil").open_float()
            end, { desc = "open parent directory" })
        end
    },
}
