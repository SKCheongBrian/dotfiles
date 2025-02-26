-- This plugin is for a recent file selector if I just start `nvim` with
-- no argument
return {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
};
