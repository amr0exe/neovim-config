return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            --vim.cmd([[colorscheme tokyonight-night]])

            --vim.cmd([[
                --highlight Normal guibg=#121010
                --highlight LineNr guibg=#0f0e0e
                --highlight CursorLine guibg=#262626
                --highlight String guifg=#808a9c
            --]])
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function ()

            require("rose-pine").setup({
                --variant = "moon",
                styles = { italic = true },
                highlight_groups = {
                    Comment = { italic = true },
                    Function = { italic = true },
                    Keyword = { italic = true }
                }
            })

            --vim.cmd([[colorscheme rose-pine]])
            --vim.cmd([[colorscheme retrobox]])
            --vim.cmd([[colorscheme habamax]])

			--[=[
            vim.cmd([[
                highlight Normal guibg=#000000
                highlight String guifg=#808a9c
            ]]) 
			]=]

            --vim.api.nvim_set_hl(0, "Directory", { fg = "#0077b6"})
            --vim.api.nvim_set_hl(0, "Normal", { fg = "#808a9c"})
            --vim.api.nvim_set_hl(0, "String", { fg = "#808a9c"})
        end,
    },
    {
        "vague-theme/vague.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other plugins
        config = function()
            -- NOTE: you do not need to call setup if you don't want to.
            require("vague").setup()
            vim.cmd("colorscheme vague")
        end
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function ()
            require("catppuccin").setup()
            --vim.cmd("colorscheme catppuccin")
        end
    },

    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        config = function ()
            require("kanagawa").setup()
            --vim.cmd("colorscheme kanagawa-dragon")
        end
    },

    {
        "dgox16/oldworld.nvim",
        lazy = false,
        priority = 1000,
        config = function ()
            require("oldworld").setup()
            --vim.cmd("colorscheme oldworld")
        end
    },

    {
        'everviolet/nvim', name = 'evergarden',
        priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
        opts = {
        },
        config = function ()
            --vim.cmd("colorscheme evergarden")
        end
    }
}
