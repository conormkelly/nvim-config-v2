return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "jay-babu/mason-nvim-dap.nvim",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Use Nerd Font glyphs for breakpoints
            vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
            vim.fn.sign_define("DapBreakpointCondition",
                { text = "", texthl = "DiagnosticHint", linehl = "", numhl = "" })
            vim.fn.sign_define("DapBreakpointRejected",
                { text = "", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
            vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
            vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticOk", linehl = "Visual", numhl = "" })

            -- Setup dap-ui
            dapui.setup()

            -- Setup Mason bridge
            require("mason-nvim-dap").setup({
                ensure_installed = { "delve", "python", "node2" },
                automatic_installation = true,
                handlers = {}, -- uses default setups
            })

            -- Auto-open/close UI with dap lifecycle
            dap.listeners.before.attach.dapui_config = function() dapui.open() end
            dap.listeners.before.launch.dapui_config = function() dapui.open() end
            dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
            dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
        end,

        -- Keybindings
        keys = {
            { "<F5>",       function() require("dap").continue() end,          desc = "DAP Continue" },
            { "<F10>",      function() require("dap").step_over() end,         desc = "DAP Step Over" },
            { "<F11>",      function() require("dap").step_into() end,         desc = "DAP Step Into" },
            { "<F12>",      function() require("dap").step_out() end,          desc = "DAP Step Out" },
            { "<leader>b",  function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
            { "<leader>dr", function() require("dap").repl.open() end,         desc = "Open DAP REPL" },
            { "<leader>du", function() require("dapui").toggle() end,          desc = "Toggle DAP UI" },
        },
    },
}
