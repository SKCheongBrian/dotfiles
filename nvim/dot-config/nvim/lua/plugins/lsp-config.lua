-- Lsp related things
return {
  -- for haskell
  {
    'mrcjkb/haskell-tools.nvim',
    version = '^4', -- Recommended
    lazy = false,
  },
  -- plugin to help manage and install lsp
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  -- interface mason with lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "jdtls" }
      })
    end
  },
  -- forgot what this is for but is necessary
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup_handlers {
        function(server_name)
          if server_name == 'jdtls' then
            return
          end
          lspconfig[server_name].setup({
            capabilities = capabilities
          })
        end,
      }
      require("which-key").add({
        { "<leader>c",  group = "[c]ode" },
        { "<leader>cd", group = "[d]ebug" },
        { "<leader>r",  group = "[r]ename" },
      })
      -- K for hover duh haha
      vim.diagnostic.config({ virtual_text = true, jump = { float = true } })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover" })
      vim.keymap.set({ 'n' }, '<leader>rn', vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
    end
  },
  {
    "mfussenegger/nvim-jdtls"
  }
}
