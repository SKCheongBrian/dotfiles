-- mini plugin ecosystem i only use a few
return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    -- this is to have better `a` and `i` operators
    require('mini.ai').setup()
    -- this is to have commenting lol
    require('mini.comment').setup()
    -- enables editing surrounding things
    require('mini.surround').setup()
    -- require('mini.statusline').setup()
  end
}
