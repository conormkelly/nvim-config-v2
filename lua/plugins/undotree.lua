return {
	"mbbill/undotree",
	-- lazy-load when you run :UndotreeToggle or hit the key below
	cmd = "UndotreeToggle",
	keys = {
		{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
	},
}

