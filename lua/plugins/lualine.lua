return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- Ensure this loads after your colorscheme
    after = 'onedark.nvim',
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'onedark',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 50,
                    tabline = 100,
                    winbar = 100,
                },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = {
                    {
                        'filename',
                        path = 3, -- Show full path in status bar
                    }
                },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {},
        }
    end,
}
