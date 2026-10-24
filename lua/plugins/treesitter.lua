-- Parsers to install (parser names, not filetypes)
local languages = {
	"bash",
	"c",
	"css",
	"go",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"rust",
	"toml",
	"typescript",
	"vim",
	"yaml",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		-- the main branch does not support lazy-loading
		lazy = false,
		-- parsers must match the plugin's pinned versions after every update
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install(languages)

			-- Highlighting comes from Neovim itself and must be started per buffer.
			-- Enable it for any filetype whose parser is available, and use
			-- treesitter indentation where the language ships an indents query.
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
				callback = function(args)
					local lang = vim.treesitter.language.get_lang(args.match)
					if not lang or not vim.treesitter.language.add(lang) then
						return
					end
					vim.treesitter.start(args.buf, lang)
					if vim.treesitter.query.get(lang, "indents") then
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		-- must track the same branch as nvim-treesitter
		branch = "main",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true, -- jump forward to textobj
				},
				move = {
					set_jumps = true, -- add to jumplist
				},
			})

			local select = require("nvim-treesitter-textobjects.select")
			local move = require("nvim-treesitter-textobjects.move")

			-- Select around/inside functions and classes
			for keys, capture in pairs({
				af = "@function.outer",
				["if"] = "@function.inner",
				ac = "@class.outer",
				ic = "@class.inner",
			}) do
				vim.keymap.set({ "x", "o" }, keys, function()
					select.select_textobject(capture, "textobjects")
				end, { desc = "Select " .. capture })
			end

			-- Jump between functions; ]] / [[ are left to Snacks.words (next/prev reference)
			vim.keymap.set({ "n", "x", "o" }, "]m", function()
				move.goto_next_start("@function.outer", "textobjects")
			end, { desc = "Next function start" })
			vim.keymap.set({ "n", "x", "o" }, "[m", function()
				move.goto_previous_start("@function.outer", "textobjects")
			end, { desc = "Previous function start" })
		end,
	},
}
