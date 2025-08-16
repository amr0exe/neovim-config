return {
    {
        "windwp/nvim-ts-autotag",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {},
        config = function(_, opts)
            require("nvim-ts-autotag").setup(opts)
        end,
    },
}