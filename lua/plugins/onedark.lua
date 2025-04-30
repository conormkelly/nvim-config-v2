return {
    "navarasu/onedark.nvim",
    -- load it at startup, before any colorscheme call
    lazy     = false,
    priority = 1000,
    config   = function()
        -- choose your style, or drop `style=` line to use default ('dark')
        require("onedark").setup {
            style = "darker",
            transparent = false,
            term_colors = true,
            ending_tildes = false,
            toggle_style_key = nil,
        }
        -- actually apply the colorscheme
        require("onedark").load()
    end,
}
