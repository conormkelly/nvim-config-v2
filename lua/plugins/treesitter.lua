return {
	"nvim-treesitter/nvim-treesitter",
	-- run the TSUpdate command after install/update
	build = ":TSUpdate",
	-- lazy-load when a buffer is read or created
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/playground", -- interactive query inspector
		-- branch must match nvim-treesitter's (master uses the nvim-treesitter.configs API below)
		{ "nvim-treesitter/nvim-treesitter-textobjects", branch = "master" },
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			-- list of parser names, or "all"
			ensure_installed = {
				"bash",
				"c",
				"css",
				"go",
				"javascript",
				"typescript",
				"json",
				"lua",
				"markdown",
				"python",
				"vim",
				"yaml",
			},

			-- enable syntax highlighting
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			-- indentation based on treesitter
			indent = {
				enable = true,
			},

			-- incremental selection (expand/shrink node)
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>v", -- start selection
					node_incremental = "<leader>vn", -- expand to next node
					node_decremental = "<leader>vd", -- shrink to previous node
					scope_incremental = "<leader>vs", -- expand to scope
				},
			},

			-- textobjects (select around functions, classes, etc.)
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- jump forward to textobj
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- add to jumplist
					-- ]] / [[ are left to Snacks.words (next/prev reference)
					goto_next_start = {
						["]m"] = "@function.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
					},
				},
			},

			-- playground settings
			playground = {
				enable = true,
				updatetime = 25, -- debounced time for highlighting nodes
				persist_queries = false,
			},
		})
	end,
}
