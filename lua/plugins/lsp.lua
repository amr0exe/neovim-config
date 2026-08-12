return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        opts = {
            ui = {
                border = "rounded",
            },
        },
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = { "gopls" },
        },
    },

    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },

    {
        "saghen/blink.cmp",
        version = "*", -- use the release tag, requires prebuilt binaries
        dependencies = "rafamadriz/friendly-snippets",
        opts = {
            keymap = {
                preset = "default",
                ["<C-l>"] = { "accept", "fallback" },
            },
            appearance = {
                nerd_font_variant = "mono",
            },
            completion = {
                documentation = { auto_show = true },
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
        },
        opts_extend = { "sources.default" },
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "folke/lazydev.nvim",
            "saghen/blink.cmp",
        },
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)        -- go_to_def
                    vim.keymap.set("n", "gra", vim.lsp.buf.code_action, opts)      -- code_actions
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)    -- goto implementation
                    vim.keymap.set("n", "grr", vim.lsp.buf.references, opts)       -- references of used
                    vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)           -- rename symbol package project-wide
                    vim.keymap.set("n", "<C-K>", vim.lsp.buf.signature_help, opts) -- lsp-signature help from inside_function
                end
            })

            vim.lsp.config("*", {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
            })

            vim.lsp.enable({ "lua_ls", "gopls" })
        end,
    },
}
