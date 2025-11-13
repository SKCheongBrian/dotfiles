-- return {
--   -- 'mellow-theme/mellow.nvim',
--   dir = '~/src/banagawa.nvim/',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme('kanagawa-lotus')
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
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function ()
        vim.opt.termguicolors = true
        vim.cmd.colorscheme('moonfly')
    end
}
