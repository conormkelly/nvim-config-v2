return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {}

        -- Smart toggle/focus keymap
        vim.keymap.set("n", "<leader>pv", function()
            local view = require("nvim-tree.view")
            if view.is_visible() then
                if view.get_winnr() == vim.api.nvim_get_current_win() then
                    vim.cmd("NvimTreeToggle")
                else
                    vim.cmd("NvimTreeFocus")
                end
            else
                vim.cmd("NvimTreeToggle")
            end
        end, { desc = "Toggle or focus NvimTree" })
    end,
}
