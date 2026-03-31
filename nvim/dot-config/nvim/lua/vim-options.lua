-- Set leader key to space because I am not retarded
vim.g.mapleader = " "
-- Some tab stuff so that I don't lose my mind
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
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

-- Add the site directory to the runtimepath
vim.opt.rtp:prepend("~/.local/share/nvim/site")

-- highlight text that is yanked
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- install treesitter grammar if don't have
-- if present or after installation, start treesitter highlighting
vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        local treesitter = require('nvim-treesitter')
        local lang = vim.treesitter.language.get_lang(args.match)
        if vim.list_contains(treesitter.get_available(), lang) then
            if not vim.list_contains(treesitter.get_installed(), lang) then
                treesitter.install(lang):wait()
            end
            vim.treesitter.start(args.buf)
        end
    end,
    desc = "Enable nvim-treesitter and install parser if not installed"
})
