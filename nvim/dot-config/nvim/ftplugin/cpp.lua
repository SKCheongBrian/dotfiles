local function compile_cpp()
    local filename = vim.fn.expand("%")
    local cmd = "g++ -std=c++11 " .. filename .. " -o " .. vim.fn.expand('%:r')

    local output = vim.fn.system(cmd)
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_err_writeln("Compilation failed:\n" .. output)
    else
        vim.api.nvim_out_write("Compilation successful!\n")
    end
end
vim.api.nvim_create_user_command('CompileCpp', compile_cpp, {})
