return {
    "RRethy/vim-illuminate",
    -- Ensure Treesitter is installed before setting up illuminate
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        -- Use LSP, then Treesitter, then regex for reference detection
        require('illuminate').configure({
            providers = { 'lsp', 'treesitter', 'regex' },
            delay = 100,
            -- Keep default keymaps or set your own below
            disable_keymaps = false,
        })
        -- Optional: custom mappings to jump between references
        vim.keymap.set('n', '<M-n>', function() require('illuminate').goto_next_reference(false) end, { desc = 'Next reference' })
        vim.keymap.set('n', '<M-p>', function() require('illuminate').goto_prev_reference(false) end, { desc = 'Prev reference' })
    end,
}

