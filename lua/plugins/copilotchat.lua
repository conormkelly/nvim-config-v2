return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        { "github/copilot.vim" },
        { "nvim-lua/plenary.nvim" },
        { "folke/snacks.nvim" },
    },
    build = "make tiktoken",
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "CopilotChat",
            callback = function()
                vim.b.copilot_enabled = false
            end,
        })
    end,
    opts = {
        selection = function(source)
            local select = require("CopilotChat.select")
            return select.visual(source) or select.buffer(source)
        end,
        window = {
            layout = "float",
            width = 0.8,
            height = 0.8,
            border = "rounded",
            title = "Copilot Chat",
        },
        prompts = {
            ExplainGo = {
                prompt = "Explain the following Go code in detail.",
                system_prompt = "You are a helpful Go tutor who explains code in plain language.",
                mapping = "<leader>cge",
                description = "Explain Go code",
            },
            GenerateCommit = {
                prompt =
                    "Write a commit message for the change with commitizen convention. " ..
                    "Keep the title under 50 characters and wrap message at 72 characters. " ..
                    "Format as a gitcommit code block.",
                context = "git:staged",
                mapping = "<leader>gc",
                description = "Generate conventional commit message",
            },
        },
    },
    keys = {
        { "<leader>cc",  "<cmd>CopilotChatToggle<cr>",         desc = "Toggle Copilot Chat" },
        { "<leader>cge", "<cmd>CopilotChatExplainGo<cr>",      desc = "Explain Go Code (Custom)" },
        { "<leader>gc",  "<cmd>CopilotChatGenerateCommit<cr>", desc = "Generate Commit Message" },
    },
    cmd = {
        "CopilotChat", "CopilotChatToggle", "CopilotChatPrompts",
        "CopilotChatModels", "CopilotChatAgents"
    },
}

