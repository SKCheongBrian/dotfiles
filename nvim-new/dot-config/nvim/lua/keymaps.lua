vim.g.mapleader = " "
vim.g.maplocalleader = " "

local setkey = vim.keymap.set

-- replaces selected text without losing yanked text
setkey("x", "p", [["_dP]], { desc = "Past over selection without losing yanked text" })

-- Delete text without saving it to any register
setkey({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Clear search highlighting
setkey("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlighting", silent = true })

-- Move lines up and down by selecting the line and pressing J/K
setkey("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
setkey("v", "K", ":m '>-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

-- Indent and keep selection when in visual mode
setkey("v", "<", "<gv", { desc = "Unindent and keep selection" })
setkey("v", ">", ">gv", { desc = "Indent and keep selection" })

setkey("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
setkey("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

-- Better search result (centered)
setkey("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
setkey("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

-- Substitute word at cursor
setkey("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word at cursor" })

-- Native undotree
setkey("n", "<leader>u", function()
  vim.cmd.packadd("nvim.undotree")
  require("undotree").open()
end, { desc = "Toggle Builtin Undotree" } )
