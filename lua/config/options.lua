
-- for line-numbers 
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.fillchars = { eob = " " }

-- for tab-based indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- sync clipboard to system
vim.opt.clipboard = 'unnamedplus'

-- Enable cursor-line 
vim.opt.cursorline = true

-- prevent line-break
vim.o.wrap = false

-- remove auto-identing comment
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- block_style_cursor
--vim.o.guicursor = "n-v-c:block,i-ci-ve:block,r-cr-o:hor20"
