-- Treesitter stuff
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      -- Ensure the parser is installed
      ensure_installed = { "java", "c", "lua", "vimdoc", "haskell" }, -- Add all languages you use
      -- Enable highlighting
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true, -- Set to true if needed
      },
      -- Optional: Enable indentation
      indent = { enable = true },
      -- Optional: Enable folds
      -- folds = { enable = true },
    })
  end
}
