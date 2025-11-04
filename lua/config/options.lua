-- for line-numbers 
--vim.opt.number = true
--vim.opt.relativenumber = true
--vim.opt.fillchars = { eob = " " }

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

-- for smoothscroll
vim.o.smoothscroll = true

-- remove auto-identing comment
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- for error diagnostics
vim.diagnostic.config({
    virtual_text = {
        prefix = "E",
        spacing = 2,
    },
    signs = false, 
    underline = false,
    update_in_insert = false,
    severity_sort = true,
})

-- highlight-on-yank
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function() 
        vim.highlight.on_yank()
    end,
})

-- spaces for haskell
vim.api.nvim_create_autocmd("FileType", {
	pattern = "haskell,cabal",
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = true
		vim.opt_local.smarttab = true
		vim.opt_local.autoindent = true
	end
})

-- for aiken syntax-highlighting
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.ak",
  callback = function()
    vim.lsp.buf.format({async = false})
  end
})

-- block_style_cursor
--vim.o.guicursor = "n-v-c:block,i-ci-ve:block,r-cr-o:hor20"
