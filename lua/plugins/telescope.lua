return {
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },

        config = function ()
            require('telescope').setup {
                pickers = {
                    find_files = {
                        theme = "ivy"
                    },
                    buffers = {
                        theme = "ivy"
                    },
                    live_grep = {
                        theme = "ivy"
                    },
                    help_tags = {
                        theme = "ivy"
                    },
                    marks = {
                        theme = "dropdown"
                    },
                    colorscheme = {
                        theme = "dropdown"
                    },
                },
                extensions = {
                    fzf = {}
                }
            }

            vim.keymap.set("n", "<space>h", require('telescope.builtin').help_tags)
            vim.keymap.set("n", "<space>f", require('telescope.builtin').find_files)
            vim.keymap.set("n", "<space>b", require('telescope.builtin').buffers)
            vim.keymap.set("n", "<space>g", require('telescope.builtin').live_grep)
            vim.keymap.set("n", "<space>sm", require('telescope.builtin').marks)
            vim.keymap.set("n", "<space>th", require('telescope.builtin').colorscheme)
            vim.keymap.set("n", "<space>en", function ()
                require('telescope.builtin').find_files {
                    cwd = vim.fn.stdpath('config')
                }
            end)
        end
    }
}

