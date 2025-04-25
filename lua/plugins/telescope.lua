return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    -- lazy-load on first Telescope command or keypress
    cmd = 'Telescope',
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Telescope find files' },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>',  desc = 'Telescope live grep' },
        { '<leader>gf', '<cmd>Telescope git_files<cr>',  desc = 'Telescope git files' },
        { '<leader>fb', '<cmd>Telescope buffers<cr>',    desc = 'Telescope buffers' },
        { '<leader>fh', '<cmd>Telescope help_tags<cr>',  desc = 'Telescope help tags' },
    },
    config = function()
        -- any Telescope setup() options you want
        require('telescope').setup {
            defaults = {
                -- e.g. prompt_prefix = '🔍 ',
            },
        }
        -- (optional) if you prefer the Lua API mappings instead of `keys = {...}` above:
        -- local builtin = require('telescope.builtin')
        -- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        -- vim.keymap.set('n', '<leader>fg', builtin.live_grep,  { desc = 'Telescope live grep' })
        -- vim.keymap.set('n', '<leader>fb', builtin.buffers,    { desc = 'Telescope buffers' })
        -- vim.keymap.set('n', '<leader>fh', builtin.help_tags,  { desc = 'Telescope help tags' })
    end,
}
