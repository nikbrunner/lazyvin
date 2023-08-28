---@type LazySpec
local spec = {
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
      id = "wtf-gw",
      mode = { "n" },
      function()
        require("wtf").ai()
      end,
      desc = "Debug diagnostic with AI",
    },
    {
      "gW",
      id = "wtf-gW",
      mode = { "n" },
      function()
        require("wtf").search()
      end,
      desc = "Search diagnostic with Google",
    },
  },
}

return spec
