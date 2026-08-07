return {
    -- Autocompletion
    { "hrsh7th/nvim-cmp",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "L3MON4D3/LuaSnip" },
            -- Snippets
            { "rafamadriz/friendly-snippets" },
        }
    },

    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v4.x",
        event = "VeryLazy",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
        },
        config = function()
            local lsp_zero = require("lsp-zero")

            local lsp_attach = function(client, bufnr)
                local opts = { buffer = bufnr }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
            end

            lsp_zero.extend_lspconfig({
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
                lsp_attach = lsp_attach,
            })

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = { "ts_ls", "gopls", "rust_analyzer", "clangd", "lua_ls", "pylsp" },
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({})
                    end,

                    vim.lsp.config("lua_ls", {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                }
                            }
                        }
                    })
                },
            })

            -- Setup nvim-cmp
            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<C-L>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-N>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end),
                    ["<C-P>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end)
                }),
                sources = {
                    { name = "nvim_lsp" },
                    -- { name = "buffer" },
                    { name = "path" },
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
            })
            cmp.setup.filetype({'markdown', 'txt'}, {
                sources = {
                    {
                        name = 'buffer',
                        option = {
                            get_buffers = function ()
                                return { vim.api.nvim_get_current_buf() }
                            end
                        }
                    },
                    { name = 'path' },
                    { name = 'nvim_lsp' },
                }
            })
        end,
    },
}
