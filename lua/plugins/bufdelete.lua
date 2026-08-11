return {
    "famiu/bufdelete.nvim",
    config = function()
        vim.keymap.set("n", "<space>x", "<cmd>Bdelete<CR>", {
            silent = true,
            desc = "Delete current buffer safely",
        })
    end,
}
