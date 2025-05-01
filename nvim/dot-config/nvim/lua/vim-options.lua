-- Set leader key to space because I am not retarded
vim.g.mapleader = " "
-- Some tab stuff so that I don't lose my mind
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
-- I don't want wrapping cuz I can't fucking read wrapped text
vim.opt.wrap = false
vim.opt.formatoptions:remove { "t" }
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', {desc = 'Clear highlighting'})

-- window stuff
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- scroll off stuff
vim.opt.scrolloff = 10

-- don't show mode since it's already in the status line
vim.opt.showmode = false

-- highlight text that is yanked
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
