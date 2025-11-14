return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_view_method_viewer = "zathura"
    vim.g.vimtex_view_method_options = "@pdf"
    vim.g.vimtex_view_general_options = '-x "nvim --headless -c \"VimtexInverseSearch %f %l\""'
  end
}
