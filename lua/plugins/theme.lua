return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000, 
        config = function()
            --vim.cmd([[colorscheme tokyonight-night]])

            vim.cmd([[
                highlight Normal guibg=#121010
                highlight LineNr guibg=#0f0e0e
                highlight CursorLine guibg=#262626
                highlight String guifg=#808a9c
            ]])
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function () 

            require("rose-pine").setup({
                styles = { italic = false },
                highlight_groups = {
                    Comment = { italic = false },
                    Function = { italic = false },
                    Keyword = { italic = false }
                }
            })
            
            vim.cmd([[colorscheme rose-pine]])

            vim.cmd([[
                highlight Normal guibg=#000000
                highlight String guifg=#808a9c
            ]])

            --vim.api.nvim_set_hl(0, "Directory", { fg = "#0077b6"})
            --vim.api.nvim_set_hl(0, "Normal", { fg = "#808a9c"})
        end,
    }
}
