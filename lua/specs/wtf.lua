local M = {}

---@type LazySpec
M.spec = {
  "piersolenski/wtf.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  event = "VeryLazy",
  opts = {
    popup_type = "vertical",
    openai_model_id = "gpt-3.5-turbo",
    search_engine = "google",
  },
  keys = {
    {
      "gw",
      function()
        require("wtf").ai()
      end,
      desc = "Debug diagnostic with AI",
    },
    {
      "gW",
      function()
        require("wtf").search()
      end,
      desc = "Search diagnostic with Google",
    },
  },
}

return M.spec
