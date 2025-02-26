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
        {"<leader>c", group = "[c]ode"},
        {"<leader>cd", group = "[d]ebug"},
        {"<leader>r", group = "[r]ename"},
      })
      -- K for hover duh haha
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover" })
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to [D]efinition" })
      vim.keymap.set('n', 'gr', require('fzf-lua').lsp_references,
        { noremap = true, silent = true, desc = "Go to [r]eferences" })
      vim.keymap.set('n', 'gI', require('fzf-lua').lsp_implementations, { desc = '[G]oto [I]mplementation' })
      vim.keymap.set('n', '<leader>D', require('fzf-lua').lsp_typedefs, { desc = 'Type [D]efinitions' })
      vim.keymap.set({ 'n' }, '<leader>ca', require('fzf-lua').lsp_code_actions, { desc = "[C]ode [A]ction" })
      vim.keymap.set({ 'n' }, '<leader>rn', vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
    end
  },
  {
    "mfussenegger/nvim-jdtls"
  }
}
