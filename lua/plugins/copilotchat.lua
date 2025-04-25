return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        { "github/copilot.vim" },
        { "nvim-lua/plenary.nvim" },
        { "folke/snacks.nvim" },
    },
    build = "make tiktoken", -- Needed for macOS/Linux for token counting
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
        },
    },
    keys = {
        { "<leader>cc",  "<cmd>CopilotChatToggle<cr>",    desc = "Toggle Copilot Chat" },
        { "<leader>cge", "<cmd>CopilotChatExplainGo<cr>", desc = "Explain Go Code (Custom)" },
    },
    cmd = {
        "CopilotChat", "CopilotChatToggle", "CopilotChatPrompts",
        "CopilotChatModels", "CopilotChatAgents"
    },
}
