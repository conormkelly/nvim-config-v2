return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>F",
			function()
				vim.lsp.buf.format()
			end,
			desc = "Format Buffer",
		},
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,

				-- JavaScript / TypeScript / HTML / CSS / Markdown
				null_ls.builtins.formatting.prettier.with({
					filetypes = { "javascript", "typescript", "html", "css", "markdown", "json", "yaml" },
				}),

				-- Python
				null_ls.builtins.formatting.black,

				-- Shell
				null_ls.builtins.formatting.shfmt,

				-- Go
				null_ls.builtins.formatting.goimports,

				-- C
				null_ls.builtins.formatting.clang_format,
			},

			-- Format on save
			on_attach = function(client, bufnr)
				if client:supports_method("textDocument/formatting") then
					local group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
					vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = group,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}
