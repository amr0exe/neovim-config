return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",  -- or use "v3.x" if you prefer the latest version (update presets accordingly)
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "L3MON4D3/LuaSnip" },
            -- Snippets
            { "rafamadriz/friendly-snippets" },
			-- syntax highlight for aiken
			{ "aiken-lang/editor-integration-nvim",
			  dependencies = { "neovim/nvim-lspconfig" }
			}
        },
        config = function()
			vim.filetype.add({
				extension = {
				ak = "aiken"
				},
			})

            local lsp = require("lsp-zero").preset("recommended")

            -- Setup Mason so you can install LSP servers from inside Neovim
            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "pylsp",
                    "prismals",
                    "jdtls",
                    "gopls",
                    "rust_analyzer",
                    "ts_ls",
                },
                automatic_installation = true,
                handlers = {
                    function(server_name)
                        require('lsp-zero').default_setup(server_name)
                    end,
                }
            })

            -- Attach common keybindings once a language server connects to a buffer
            lsp.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
                -- add any additional mappings here
            end)

            -- Setup nvim-cmp integration for autocompletion
            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
            })

            -- for rust-lsp
            lsp.configure("rust_analyzer", {
                root_dir = require("lspconfig.util").root_pattern("cargo.toml", "rust-analyzer.toml", ".git"),
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            allFeatures = true,
                        },
                        check = {
                            command = "clippy",
                        },
                        procMacro = {
                            enable = true,
                        },
                    },
                },
            })

            -- for js/ts
            lsp.configure("ts_ls", {
                root_dir = function(fname)
                    local util = require("lspconfig.util")
                    return util.root_pattern('tsconfig.json', 'package.json')(fname) or
                        util.root_pattern('.git')(fname) or
                        util.path.dirname(fname) -- Fallback to file's directory

                end,
                single_file_support = false,
                on_attach = function(client, bufnr)
                end,
            })

            -- for go-lsp
            lsp.configure("gopls", {
                root_dir = require("lspconfig.util").root_pattern("go.mod", ".git"),
            })

            require('lspconfig').hls.setup({
                cmd = { "haskell-language-server-wrapper", "--lsp" },
                on_attach = function(client, bufnr)
                    require('lsp-zero').on_attach(client, bufnr)
                end,
            })

			require('lspconfig').clangd.setup{}
			require('lspconfig').aiken.setup({
				cmd = { "aiken", "lsp" },
				filetypes = { "aiken" },
				root_dir = require("lspconfig.util").root_pattern("aiken.toml")
			})

            lsp.setup()
        end,

    },
}
