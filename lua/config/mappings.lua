

-- set the leader key to space
vim.g.mapleader = " "

-- for <Esc> to jj 
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })

-- for closing buffer with <leader>x
vim.api.nvim_set_keymap("n", "<leader>x", "<cmd>bd<CR>", { noremap = true, silent = true })

-- move between buffers
vim.keymap.set('n', '<tab>', ':bnext<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<s-tab>', ':bprevious<cr>', { noremap = true, silent = true })