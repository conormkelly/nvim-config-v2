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

        vim.lsp.config("rust_analyzer", {
            settings = {
                ["rust-analyzer"] = {
                    -- Surface clippy lints on save, matching `cargo clippy` in CI
                    check = { command = "clippy" },
                },
            },
            -- Format with rustfmt on save (none-ls has no Rust formatter)
            on_attach = function(client, bufnr)
                local group = vim.api.nvim_create_augroup("RustFormatOnSave", { clear = false })
                vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = group,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = bufnr, id = client.id })
                    end,
                })
            end,
        })

        -- Install these servers; every installed server is enabled via vim.lsp.enable()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",   -- C/C++
                "gopls",    -- Go
                "lua_ls",   -- Lua
                "pyright",  -- Python
                "rust_analyzer", -- Rust
                "ts_ls",    -- TypeScript / JavaScript / React
                "html",     -- HTML
                "sqls",     -- SQL
            },
        })
    end,
}
