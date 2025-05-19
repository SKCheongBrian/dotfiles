-- return {
--   -- 'mellow-theme/mellow.nvim',
--   dir = '~/src/banagawa.nvim/',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme('kanagawa-lotus')
--   end,
-- }
return {
    'webhooked/kanso.nvim',
    lazy = false,
    priority = 1000,
    config = function ()
        vim.cmd.colorscheme('kanso-zen')
    end
}
