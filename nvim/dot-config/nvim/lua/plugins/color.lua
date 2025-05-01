return {
  -- 'mellow-theme/mellow.nvim',
  dir = '~/src/banagawa.nvim/',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('kanagawa-lotus')
  end,
}
