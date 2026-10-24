return {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost", -- or LazyLoad as you like
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("treesitter-context").setup({
            enable = true,        -- Enable this plugin
            max_lines = 3,        -- Max lines for the context window
            trim_scope = "outer", -- "inner" or "outer"
            mode = "cursor",      -- Show context for the current cursor line
            separator = nil,      -- Optionally use a separator like `─`
        })
    end,
}
