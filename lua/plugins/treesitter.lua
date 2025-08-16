return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "rust", "go", "javascript", "typescript", "html", "css", "bash", "tsx", "markdown", "markdown_inline" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}
