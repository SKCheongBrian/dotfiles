return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  priority = 1000,
  lazy = false,
  opts = {
    winopts = {
      split = 'belowright new'
    },
  },
  keys = {
    -- Find
    { '<leader>ff', function() FzfLua.files() end,                 desc = "Smart Find Files" },
    { '<leader>fg', function() FzfLua.live_grep() end,             desc = 'Grep' },
    { '<leader>fb', function() FzfLua.buffers() end,               desc = 'Find buffer' },
    -- Lsp
    { 'gd',         function() FzfLua.lsp_definitions() end,       desc = "Go to [D]efinition" },
    { 'gr',         function() FzfLua.lsp_references() end,        desc = "Go to [r]eferences",     nowait = true },
    { 'gI',         function() FzfLua.lsp_implementations() end,   desc = '[G]oto [I]mplementation' },
    { "gy",         function() FzfLua.lsp_typedefs() end,          desc = "Goto T[y]pe Definition" },
    { '<leader>ca', function() FzfLua.lsp_code_action() end,       desc = "[C]ode [A]ction" },
    -- Search
    { "<leader>sm", function() FzfLua.marks() end,                 desc = "Marks" },
    { "<leader>sd", function() FzfLua.diagnostics_document() end,  desc = "Diagnostics" },
    { "<leader>ss", function() FzfLua.lsp_document_symbols() end,  desc = "LSP Symbols" },
    { "<leader>sS", function() FzfLua.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    -- Git
    { "<leader>gb",      function() FzfLua.git_branches() end,          desc = "Git Branches" },
    { "<leader>gl",      function() FzfLua.git_commits() end,               desc = "Git Log" },
    { "<leader>gs",      function() FzfLua.git_status() end,            desc = "Git Status" },
    { "<leader>gS",      function() FzfLua.git_stash() end,             desc = "Git Stash" },
    { "<leader>gf",      function() FzfLua.git_files() end,             desc = "Git Files" },
  },
}
