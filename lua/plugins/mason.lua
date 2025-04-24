return {
	"williamboman/mason.nvim",
	lazy = false,
	cmd = "Mason",
	keys = { { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" } },
	build = ":MasonUpdate",
	config = function() require("mason").setup() end,
}

