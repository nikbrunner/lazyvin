local M = {}

M.spec = {
  "svermeulen/text-to-colorscheme.nvim",
  opts = {
    ai = {
      openai_api_key = os.getenv("OPENAI_API_KEY"),
      gpt_model = "gpt-4",
    },
    hex_palettes = {
      {
        name = "iceland",
        background_mode = "dark",
        background = "#1b1b1b",
        foreground = "#f5f5f5",
        accents = {
          "#ffbc34",
          "#ff7834",
          "#818181",
          "#a3a3a3",
          "#b2b2b2",
          "#d6d6d6",
          "#ebebeb",
        },
      },
      {
        name = "tropical island",
        background_mode = "dark",
        background = "#163024",
        foreground = "#dff7d7",
        accents = {
          "#2db0a5",
          "#ffcd46",
          "#ffd64e",
          "#ff6159",
          "#8760ff",
          "#7bd555",
          "#ffadbe",
        },
      },
    },
    default_palette = "iceland",
  },
  config = function(_, opts)
    require("text-to-colorscheme").setup(opts)
  end,
}

return M.spec
