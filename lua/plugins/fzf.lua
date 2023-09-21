local M = {}

M.win_presets = {
  small = {
    no_preview = {
      winopts = {
        height = 0.35,
        width = 0.65,
        preview = {
          hidden = "hidden",
        },
      },
    },
  },
  medium = {
    vertical = {
      winopts = {
        height = 0.65,
        width = 0.65,
        preview = {
          layout = "vertical",
          vertical = "up:65%",
        },
      },
    },
  },
  large = {
    vertical = {
      winopts = {
        height = 0.9,
        width = 0.9,
        preview = {
          layout = "vertical",
          vertical = "up:65%",
        },
      },
    },
  },
  full = {
    vertical = {
      winopts = {
        fullscreen = true,
        preview = {
          layout = "vertical",
          vertical = "up:65%",
        },
      },
    },
  },
}

M.fzf = function(cmd, opts)
  opts = opts or {}
  return function()
    require("fzf-lua")[cmd](opts)
  end
end

---@type LazySpec
M.spec = {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<leader><space>",
      id = "<leader><space>",
      mode = { "n" },
      -- function()
      -- require("fzf-lua").files(M.win_presets.medium.vertical)
      M.fzf("files", M.win_presets.medium.vertical),
      -- end,
      desc = "Files with FzfLua",
    },
  },
  config = function()
    require("fzf-lua").setup({})
  end,
}

return M.spec
