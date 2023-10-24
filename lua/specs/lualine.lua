local M = {}

---@type LazySpec
M.spec = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "meuter/lualine-so-fancy.nvim",
  },
  event = "VeryLazy",
  opts = function()
    local icons = require("lazyvim.config").icons
    local lazyvim_util = require("lazyvim.util")

    local fnamemodify = vim.fn.fnamemodify

    local mode = {
      function()
        return "  "
      end,
      padding = {
        left = 3,
        right = 3,
      },
      separator = { left = "", right = "" },
    }

    local filetype = {
      "fancy_filetype",
      ts_icon = "",
      padding = {
        left = 1,
        right = 1,
      },
      separator = { left = "", right = "" },
    }

    local diagnostics = {
      "diagnostics",
      symbols = {
        error = icons.diagnostics.Error,
        warn = icons.diagnostics.Warn,
        info = icons.diagnostics.Info,
        hint = icons.diagnostics.Hint,
      },
    }

    local project_name = {
      function()
        local current_project_folder = fnamemodify(vim.fn.getcwd(), ":t")
        local parent_project_folder = fnamemodify(vim.fn.getcwd(), ":h:t")
        return icons.kinds.Folder .. " " .. parent_project_folder .. "/" .. current_project_folder
      end,
      padding = 2,
    }

    local lazy_plug_count = {
      function()
        local stats = require("lazy").stats()
        return " " .. stats.count
      end,
    }

    local lazy_startup = {
      function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        return " " .. ms .. "ms"
      end,
    }

    local lazy_updates = {
      require("lazy.status").updates,
      padding = 1,
    }

    local dap_status = {
      function()
        return "  " .. require("dap").status()
      end,
      cond = function()
        return package.loaded["dap"] and require("dap").status() ~= ""
      end,
      color = lazyvim_util.ui.fg("Debug"),
    }

    local noice_status = {
      function()
        return require("noice").api.status.mode.get()
      end,
      cond = function()
        return package.loaded["noice"] and require("noice").api.status.mode.has()
      end,
      color = lazyvim_util.ui.fg("Constant"),
    }

    return {
      options = {
        theme = "terra",
        globalstatus = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "dashboard", "alpha", "lazy" },
          winbar = { "dashboard", "alpha", "edgy", "lazy" },
        },
      },

      sections = {
        lualine_a = {
          mode,
        },
        lualine_b = {
          project_name,
          "fancy_branch",
          "francy_diff",
        },
        lualine_c = {
          diagnostics,
        },
        lualine_x = {
          noice_status,
          { "fancy_diagnostics" },
          { "fancy_searchcount" },
        },
        lualine_y = {
          dap_status,
          lazy_startup,
          lazy_plug_count,
          lazy_updates,
        },
        lualine_z = {
          filetype,
        },
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}

return M.spec
