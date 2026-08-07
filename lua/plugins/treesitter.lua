return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",

        opts = {
            ensure_installed = {
                "lua", "rust", "go", "javascript", "typescript",
                "html", "css", "bash", "tsx",
                "markdown", "markdown_inline", "xml"
            },

            highlight = {
                enable = true,
                disable = { "xml" },
            },

            indent = { enable = false },

            autotag = {
                enable = true,
            },
        },

        configs = function(_, opts)
            vim.filetype.add({
                extension = {
                    axaml = "xml",
                },
            })

            require("nvim-treesitter.configs").setup(opts)

            vim.treesitter.language.register('xml', { 'axaml' })
        end,
    },

    {
        "windwp/nvim-ts-autotag",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {}
    },
}
