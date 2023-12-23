-- NOTE: Usage & Billing: https://platform.openai.com/account/usage
-- API Key is stored in 1Password and is set as a Environment Variable
-- API Key is exposed via `.zshenv` to prevent commiting it to dotfiles repo

local M = {}

---@type LazySpec
M.spec = {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  enabled = true,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  ---@type LazyKeys[]
  keys = {
    {
      id = "ChatGPT",
      mode = { "n", "v" },
      "<leader>cii",
      "<cmd>ChatGPT<CR>",
      {
        desc = "ChatGPT",
      },
    },
    {
      id = "ChatGPT Edit",
      mode = { "n", "v" },
      "<leader>cie",
      "<cmd>ChatGPTEditWithInstructions<CR>",
      {
        desc = "ChatGPT Edit",
      },
    },
  },
  opts = {
    openai_params = {
      -- model = "gpt-3.5-turbo",
      model = "gpt-4",
      frequency_penalty = 0,
      presence_penalty = 0,
      max_tokens = 2000,
      temperature = 0,
      top_p = 1,
      n = 1,
    },
    openai_edit_params = {
      model = "gpt-4",
      temperature = 0,
      top_p = 1,
      n = 1,
    },
    predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv",
  },
  config = function(_, opts)
    require("chatgpt").setup(opts)
  end,
}

return M.spec
