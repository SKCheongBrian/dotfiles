-- colorscheme for my neovim
return {
  'shaunsingh/solarized.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('solarized')
  end,
}
