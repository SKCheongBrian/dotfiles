vim.g.vimtex_view_method = "skim"
vim.g.vimtex_view_skim_sync = 1
vim.g.vimtex_view_skim_activate = 1
vim.g.vimtex_view_sioyek_exe = "/opt/homebrew/bin/sioyek"
vim.g.vimtex_compiler_method = "latexmk"

vim.pack.add({
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/rafamadriz/friendly-snippets",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  { src = 'https://github.com/mrcjkb/haskell-tools.nvim',       version = vim.version.range('^10') },
  "https://github.com/lervag/vimtex",
  "https://github.com/Julian/lean.nvim",
  "https://github.com/rose-pine/neovim",
  "https://github.com/metalelf0/black-metal-theme-neovim",
  {
    src = "https://github.com/obsidian-nvim/obsidian.nvim",
    version = vim.version.range "*", -- use latest release, remove to use latest commit
  },
  "https://github.com/yorik1984/newpaper.nvim",
  "https://github.com/chomosuke/typst-preview.nvim",
  "https://github.com/Julian/lean.nvim",
})

local setkeymap = vim.keymap.set

-- Lean ------------------------------------------
vim.g.lean_config = { mappings = true }

-- Typst Preview ---------------------------------
local TypstPreview = require("typst-preview")
TypstPreview.setup({})

-- Obsidian ------------------------------
local Obsidian = require("obsidian")
Obsidian.setup({
  legacy_commands = false, -- this will be removed in 4.0.0
  workspaces = {
    {
      name = "personal",
      path = "~/Desktop/spike-vault",
    },
  },
  picker = {
    name = "mini.pick",
  },
})

-- black metal theme ---------------------
-- local BlackMetal = require("black-metal")
-- BlackMetal.setup()
-- BlackMetal.load()

-- mini files ----------------------------
require("mini.files").setup({
  mappings = {
    go_in = "L",
    go_in_plus = "<CR>",
    go_out = "H",
    go_out_plus = "-",
  },
})

setkeymap("n", "<leader>-", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle file explorer" })
setkeymap("n", "-", function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
  MiniFiles.reveal_cwd()
end, { desc = "Toggle into currently opened file" })

-- mini notify ----------------------------
require("mini.notify").setup({
  -- only show messages
  content = {
    format = function(notif)
      return notif.msg
    end,
  },
})

-- mini commandline completion ------------
require("mini.cmdline").setup({
  autocorrect = { enable = false },
})

-- mini surround --------------------------
require("mini.surround").setup()

-- mini picker ----------------------------
local MiniPick = require("mini.pick")
local MiniExtra = require("mini.extra")

MiniPick.setup()
MiniExtra.setup()

setkeymap("n", "<leader>ff", function() MiniPick.builtin.files() end, { desc = "[f]ile" })
setkeymap("n", "<leader>fg", function() MiniPick.builtin.grep_live() end, { desc = "[g]rep" })
setkeymap("n", "<leader>fh", function() MiniPick.builtin.help() end, { desc = "[h]elp" })
setkeymap("n", "<leader>fb", function() MiniPick.builtin.buffers() end, { desc = "[b]uffers" })

setkeymap("n", "<leader>xx", function() MiniExtra.pickers.diagnostic() end, { desc = "Mini Picker diagnostics" })
setkeymap("n", "<leader>fk", function() MiniExtra.pickers.keymaps() end, { desc = "[k]eymap help" })

-- mini completions -----------------------
local MiniCompletion = require("mini.completion")
MiniCompletion.setup({
  lsp_completion = {
    auto_setup = true,
    process_items = function(items, base)
      return MiniCompletion.default_process_items(items, base, {
        filtersort = "fuzzy",
      })
    end,
  }
})

-- mini snippets -------------------------
local MiniSnippets = require("mini.snippets")
MiniSnippets.setup({
  snippets = {
    MiniSnippets.gen_loader.from_lang(), -- loads friendly-snippets automatically
  },
})
MiniSnippets.start_lsp_server({ match = false })

-- mini clue -----------------------------
local MiniClue = require("mini.clue")
MiniClue.setup({
  triggers = {
    -- Leader triggers
    { mode = { 'n', 'x' }, keys = '<Leader>' },

    -- `[` and `]` keys
    { mode = 'n',          keys = '[' },
    { mode = 'n',          keys = ']' },

    -- Built-in completion
    { mode = 'i',          keys = '<C-x>' },

    -- `g` key
    { mode = { 'n', 'x' }, keys = 'g' },

    -- Marks
    { mode = { 'n', 'x' }, keys = "'" },
    { mode = { 'n', 'x' }, keys = '`' },

    -- Registers
    { mode = { 'n', 'x' }, keys = '"' },
    { mode = { 'i', 'c' }, keys = '<C-r>' },

    -- Window commands
    { mode = 'n',          keys = '<C-w>' },

    -- `z` key
    { mode = { 'n', 'x' }, keys = 'z' },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    MiniClue.gen_clues.square_brackets(),
    MiniClue.gen_clues.builtin_completion(),
    MiniClue.gen_clues.g(),
    MiniClue.gen_clues.marks(),
    MiniClue.gen_clues.registers(),
    MiniClue.gen_clues.windows(),
    MiniClue.gen_clues.z(),
    { mode = "n", keys = "<Leader>c", desc = "+[c]ode" },
    { mode = "n", keys = "<Leader>x", desc = "+diagnostics" },
    { mode = "n", keys = "<Leader>f", desc = "+[f]ind" },
  },
})

-- lsp -----------------------------------
require("lsp")

-- lean ----------------------------------
local Lean = require("lean")
vim.g.lean_config = { mapping = true }
