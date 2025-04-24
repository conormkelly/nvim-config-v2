return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "TroubleToggle", "Trouble" },
    keys = {
        -- Toggle diagnostics for current buffer without focusing the Trouble window
        { "<leader>xx", "<Cmd>Trouble diagnostics toggle focus=false filter.buf=0<CR>", desc = "Toggle Trouble diagnostics" },
    },
    opts = {},  -- use this table to pass any setup options to trouble.nvim
}

