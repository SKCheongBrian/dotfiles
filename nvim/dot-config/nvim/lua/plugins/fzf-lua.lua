return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  config = function ()
    local fzflua = require('fzf-lua')
    vim.keymap.set('n', '<leader>ff', fzflua.files, { desc = 'Find file' })
    vim.keymap.set('n', '<leader>fg', fzflua.live_grep, { desc = 'Find string' })
    vim.keymap.set('n', '<leader>fb', fzflua.buffers, { desc = 'Find buffer' })
  end
}
