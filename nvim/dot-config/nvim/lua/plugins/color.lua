-- return {
--   'nkxxll/ghostty-default-style-dark.nvim',
--   -- dir = '~/src/banagawa.nvim/',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.opt.termguicolors = true
--     vim.cmd.colorscheme('ghostty-default-style-dark')
--   end,
-- }
-- return {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         vim.cmd.colorscheme('tokyonight')
--     end
-- }
return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function ()
        vim.opt.termguicolors = true
        vim.cmd.colorscheme('acme')
    end
}
