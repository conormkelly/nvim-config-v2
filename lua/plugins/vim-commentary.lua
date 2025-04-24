return {
    "tpope/vim-commentary",
    -- load when you use either built-in mapping OR your leader mapping
    keys = {
        { "gc",        mode = { "n", "v" } },
        { "gcc",       mode = "n" },
        { "<leader>/", mode = "n", desc = "Toggle comment line" },
        { "<leader>/", mode = "v", desc = "Toggle comment selection" },
    },
    config = function()
        -- Set up custom leader mappings
        vim.keymap.set("n", "<leader>/", "<Plug>CommentaryLine", { desc = "Toggle comment line" })
        vim.keymap.set("v", "<leader>/", "<Plug>Commentary", { desc = "Toggle comment selection" })
    end,
}

