return {
	"mbbill/undotree",
	-- lazy-load when you run :UndotreeToggle or hit the key below
	cmd = "UndotreeToggle",
	keys = {
		{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
	},
	config = function()
		-- Enable persistent undo
		if vim.fn.has("persistent_undo") == 1 then
			local target_path = vim.fn.expand("~/.undodir")
			-- create dir if it doesn't exist
			if vim.fn.isdirectory(target_path) == 0 then
				vim.fn.mkdir(target_path, "p", 700)
			end
			vim.o.undodir  = target_path
			vim.o.undofile = true
		end
	end,
}

