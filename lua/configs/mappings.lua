-- firstThingToDo
vim.keymap.set('i', 'jj', '<Esc>')

-- move between buffers
vim.keymap.set('n', '<TAB>', '<CMD>bnext<CR>')
vim.keymap.set('n', '<S-TAB>', '<CMD>bprev<CR>')

-- autoindenting comment fix
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
    end
})

-- highlight on attach
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end
})

-- error diagnostics
vim.keymap.set("n", "E", function()
    vim.diagnostic.config({
        virtual_text = false,
    })
    vim.diagnostic.open_float()
end)

-- format on LspAttach
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if not client then
            return
        end

        if client:supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, async = false })
                end,
            })
        end
    end,
})
