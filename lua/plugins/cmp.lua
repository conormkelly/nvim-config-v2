return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer"
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" }
            },
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm(),
            }),
        })

        -- Attach LSP capabilities to lua_ls with proper diagnostics setup
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("lspconfig").lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }, -- tell LSP that 'vim' is a known global
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false, -- prevent annoying prompts
                    },
                },
            },
        })
    end,
}
