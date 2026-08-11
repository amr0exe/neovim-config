return {
    {

        'stevearc/oil.nvim',
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        lazy = false,
        config = function()
            require("oil").setup({
                columns = {},
                view_options = {
                    show_hidden = true,
                },
                float = {
                    padding = 4,
                    max_width = 0.6,
                    max_height = 0.6,
                    border = "rounded",
                    win_options = {
                        winblend = 0,
                    },
                    preview_split = "right",
                },

                win_options = {
                    signcolumn = "yes:1",
                },
            })

            vim.keymap.set('n', '-', function()
                require('oil').open_float()
            end, { desc = "Open parent directory" })
        end,
    },
}
