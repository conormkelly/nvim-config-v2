return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig", -- provides the default server configs (lsp/<name>.lua)
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        -- Advertise nvim-cmp completion capabilities to every server
        vim.lsp.config("*", {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })

        vim.lsp.config("lua_ls", {
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

        -- Install these servers; every installed server is enabled via vim.lsp.enable()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",   -- C/C++
                "gopls",    -- Go
                "lua_ls",   -- Lua
                "pyright",  -- Python
                "ts_ls",    -- TypeScript / JavaScript / React
                "html",     -- HTML
                "sqls",     -- SQL
            },
        })
    end,
}
