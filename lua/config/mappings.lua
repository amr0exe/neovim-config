-- set the leader key to space
vim.g.mapleader = " "

-- for <Esc> to jj 
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })

-- for closing buffer with <leader>x
-- bp switches the window to previous buffer
-- | chains command, 
-- bd # deletes the buffer that used to be on this window
vim.api.nvim_set_keymap("n", "<leader>x", "<cmd>bp | bd #<CR>", { noremap = true, silent = true })

-- move between buffers
vim.keymap.set('n', '<tab>', ':bnext<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<s-tab>', ':bprevious<cr>', { noremap = true, silent = true })

-- for errors/hover
vim.keymap.set("n", "E", function()
    vim.diagnostic.open_float()
end, { noremap = true, silent = true, desc = "Show diagnostics info" }
)

-- LSP restart(ts_ls)
vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart ts_ls<CR>", {
  desc = "Restart ts_ls LSP server"
})

-- Diagnostic virtual text toggle functions
local diagnostic_virtual_text_enabled = false

local function show_diagnostics()
  vim.diagnostic.config({
    virtual_text = true,
  })
  diagnostic_virtual_text_enabled = true
  print("Diagnostics virtual_text enabled")
end

local function hide_diagnostics()
  vim.diagnostic.config({
    virtual_text = false,
  })
  diagnostic_virtual_text_enabled = false
  print("Diagnostics virtual_text disabled")
end

vim.api.nvim_create_user_command("ShowInfo", show_diagnostics, {})
vim.api.nvim_create_user_command("HideInfo", hide_diagnostics, {})

vim.keymap.set("n", "<leader>da", show_diagnostics, { desc = "Show diagnostic virtual text" })
vim.keymap.set("n", "<leader>dh", hide_diagnostics, { desc = "Hide diagnostic virtual text" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.diagnostic.config({ virtual_text = false })
    end
})

-- small term at bottom
vim.keymap.set("n", "<space>st", function ()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 10)
end)

-- hot-reload
vim.keymap.set("n", "<space><space>i", function ()
    vim.cmd("source %")
    print("config reloaded")
end)

-- print check
vim.keymap.set("n", "<space><space>pr", function ()
    print("check check check")
end)
