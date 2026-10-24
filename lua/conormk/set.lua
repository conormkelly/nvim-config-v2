-- Disable netrw (recommended when using a file explorer plugin like nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable true color support
vim.opt.termguicolors = true

-- Line numbers
vim.opt.relativenumber = true
vim.opt.nu = true

-- Tabs and indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Line wrapping
vim.opt.wrap = false

-- Swap, backup and undo settings
vim.opt.swapfile = false
vim.opt.backup = false
-- Persistent undo uses Neovim's default undodir (stdpath("state")/undo)
vim.opt.undofile = true

-- Search behavior
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Scrolling and UI settings
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

-- Visual guides
vim.opt.colorcolumn = "120"

-- Visible whitespace and end-of-buffer markers
vim.opt.list = true
vim.opt.listchars:append({
    -- eol = "↵", -- optional: end-of-line character
    trail = "·", -- trailing spaces
    -- space = "⋅", -- optional: visualize spaces
})
vim.opt.fillchars:append({
    eob = "↴", -- end-of-buffer marker (empty lines after the last buffer line)
})
