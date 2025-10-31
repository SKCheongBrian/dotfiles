return {
    "andweeb/presence.nvim",
    config = function ()
        require("presence").setup({
            workspace_text = "Working on something",
            editing_text = "Typing some symbols"
        })
    end
}
