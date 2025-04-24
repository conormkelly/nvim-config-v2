return {
	"hrsh7th/nvim-cmp",
	dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer" },
	config = function()
		local cmp = require("cmp")
		cmp.setup {
			sources = { { name = "nvim_lsp" }, { name = "buffer" } },
			mapping = cmp.mapping.preset.insert({ ["<CR>"] = cmp.mapping.confirm() }),
		}
		-- attach LSP capabilities:
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("lspconfig").lua_ls.setup { capabilities = capabilities }
	end,
}

