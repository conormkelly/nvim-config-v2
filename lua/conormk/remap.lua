vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)

-- Move selected lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in place when joining 2 lines
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor centered vertically when scrolling half pages
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Recenter screen when finding matches
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Avoid clobbering yank buffer when pasting
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to blackhole register
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

-- Prevent entering Ex mode
vim.keymap.set("n", "Q", "<nop>")

-- Recenter when navigating quickfix lists
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Recenter when jumping to end
vim.keymap.set("n", "G", "Gzz")

-- Indent without losing place
vim.keymap.set("n", "=ap", "ma=ap'a")

-- Partial search hint
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Toggle relative line numbers
vim.keymap.set("n", "<leader>rn", function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
end)


-- if err != nil ...
vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

