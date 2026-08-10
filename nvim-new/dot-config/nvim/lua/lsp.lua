require("mason").setup()

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }
    local setkeymap = vim.keymap.set

    setkeymap("n", "gi", vim.lsp.buf.implementation, opts)
    setkeymap("n", "gt", vim.lsp.buf.type_definition, opts)
    setkeymap("n", "gr", vim.lsp.buf.references, opts)
    setkeymap("n", "<leader>cn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "re[n]ame" }))
    setkeymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "[a]ction" }))
    setkeymap("n", "<leader>cl", vim.lsp.codelens.run, vim.tbl_extend("force", opts, { desc = "[l]ens" }))
    setkeymap("n", "gO", vim.lsp.buf.document_symbol, opts)
    setkeymap("i", "<C-s>", vim.lsp.buf.signature_help, opts)
    setkeymap("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Show documentation" }))
    setkeymap("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
    setkeymap("n", "<leader>cf", vim.lsp.buf.format, vim.tbl_extend("force", opts, { desc = "[f]ormat" }))
  end
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } }
    },
  },
})

vim.lsp.config("texlab", {
  settings = {
    texlab = {
      build = {
        executable = "latexmk",
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        onSave = true,
      },
      forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
    }
  }
})

vim.lsp.enable({
  "lua_ls",
  "jdtls",
  "ts_ls",
  "texlab",
})
