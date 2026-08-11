return {
    {
        "dgox16/oldworld.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("oldworld").setup({
                variant = "oled",
                styles = {
                    comments = { italic = true, bold = false },
                    booleans = { italic = true, bold = true },
                },
            })
            vim.cmd.colorscheme("oldworld")
        end
    }
}
