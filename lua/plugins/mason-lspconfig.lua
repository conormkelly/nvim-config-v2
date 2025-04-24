return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
        -- Install and manage LSP servers
        require("mason-lspconfig").setup {
            ensure_installed = {
                "clangd",   -- C/C++
                "gopls",    -- Go
                "lua_ls",   -- Lua
                "pyright",  -- Python
                "ts_ls",    -- TypeScript / JavaScript / React
                "html",     -- HTML
                "sqls",     -- SQL
            },
            automatic_installation = true,
        }

        -- Hook each installed server into lspconfig
        require("mason-lspconfig").setup_handlers {
            -- default handler for all servers
            function(server_name)
                require("lspconfig")[server_name].setup {}
            end,
        }
    end,
}

