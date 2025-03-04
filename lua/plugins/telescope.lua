return {
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.8",
        config = function() 
            require('telescope').setup({
                pickers = {
                    lsp_document_symbols = {
                        symbols = {
                            'function',
                            'method',
                            'variables',
                            'class',
                            'interfaces',
                        }
                    }
                }
            })

            -- telescope keybindings
            vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<cr>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<cr>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<cr>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<cr>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>ds', ':Telescope lsp_document_symbols<cr>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>th', ':Telescope colorscheme<cr>', { noremap = true, silent = true })
        end
    }
}
