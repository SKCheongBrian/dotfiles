vim.api.nvim_create_user_command("PackAdd", function(opts)
  vim.pack.add(opts.fargs)
end, { nargs = "+", desc = "Add plugins (:PackAdd user/repo)" })

vim.api.nvim_create_user_command("PackDel", function(opts)
  vim.pack.del(opts.fargs)
end, { nargs = "+", desc = "Delete plugins (:PackAdd user/repo)" })

vim.api.nvim_create_user_command("PackUpdate", function(opts)
  -- check if any argument is passed
  if opts.args:match("%S") then
    local plugins = vim.split(opts.args, "%s+", { trimempty = true })
    vim.pack.update(plugins)
  else
    vim.pack.update()
  end
end, { nargs = "*", desc = "Update all plugins or specific ones" })

vim.api.nvim_create_user_command("PackCheck", function()
  vim.pack.update(nil, { offline = true })
end, { desc = "Check for non-active plugins visually" })

vim.api.nvim_create_user_command('PackClean', function()
  -- Using Neovim's native ++all flag to purge undeclared pack plugins
  vim.cmd('packdel ++all') 
  vim.notify("Cleaned all inactive plugins.", vim.log.levels.INFO)
end, { desc = "Delete all inactive plugins" })

vim.api.nvim_create_user_command("LspLog", function()
  vim.cmd.edit(vim.fn.fnameescape(vim.lsp.log.get_filename()))
end, { desc = "Open the Neovim LSP log" })
