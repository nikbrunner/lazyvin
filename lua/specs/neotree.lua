local M = {}

---@type LazySpec
M.specs = {
  {
    "nvim-neo-tree/neo-tree.nvim",
    ---@diagnostic disable-next-line: assign-type-mismatch
    keys = function()
      local function close_side_panels()
        vim.cmd("Neotree left close")
        vim.cmd("Neotree right close")
      end

      return {
        {
          "<leader>ee",
          function()
            require("neo-tree.command").execute({ position = "left", source = "filesystem", toggle = true })
          end,
          desc = "Files",
        },
        {
          "<leader>eg",
          function()
            require("neo-tree.command").execute({ position = "right", source = "git_status", toggle = true })
          end,
          desc = "Git Status",
        },
        {
          "<leader>eb",
          function()
            require("neo-tree.command").execute({ position = "right", source = "buffers", toggle = true })
          end,
          desc = "Buffers",
        },
        {
          "<C-f>",
          function()
            close_side_panels()
            vim.cmd("Neotree float toggle reveal")
          end,
          desc = "Float Files",
        },
        {
          "<C-g>",
          function()
            close_side_panels()
            vim.cmd("Neotree float git_status toggle reveal")
          end,
          desc = "Float Git Status",
        },
        {
          "<C-e>",
          function()
            vim.cmd("Neotree float buffers toggle reveal")
          end,
          desc = "Float Buffer Tree",
        },
      }
    end,
    opts = function(_, default_opts)
      return vim.tbl_deep_extend("force", default_opts, {
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_hidden = false, -- only works on Windows for hidden files/directories
          },
        },
        source_selector = {
          winbar = false,
          statusline = false, -- toggle to show selector on statusline
          content_layout = "center",
          tabs_layout = "equal",
          sources = {
            {
              source = "filesystem",
              display_name = "Files",
            },
            {
              source = "git_status",
              display_name = "Git",
            },
            {
              source = "buffers",
              display_name = "Buffers",
            },
          },
        },

        event_handlers = {
          -- {
          --   event = "file_opened",
          --   handler = function(file_path)
          --     require("neo-tree").close_all()
          --   end,
          -- },
        },

        window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
          -- possible options. These can also be functions that return these options.
          position = "left", -- left, right, top, bottom, float, current
          width = 40, -- applies to left and right positions
          popup = { -- settings that apply to float position only
            size = { height = "25" },
            position = "50%", -- 50% means center it
          },
          mappings = {
            ["<space>"] = false, -- disable for leader
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "revert_preview",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["s"] = "open_split",
            ["S"] = "split_with_window_picker",
            ["v"] = "open_vsplit",
            ["V"] = "vsplit_with_window_picker",
            ["t"] = "open_tabnew",
            ["w"] = "open_with_window_picker",
            ["C"] = "close_node",
            ["M"] = "close_all_nodes",
            ["O"] = "expand_all_nodes",
            ["R"] = "refresh",
            ["a"] = { "add", config = { show_path = "relative" } }, -- "none", "relative", "absolute"
            ["A"] = "add_directory", -- also accepts the config.show_path option.
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy", -- takes text input for destination, also accepts the config.show_path option
            ["m"] = "move", -- takes text input for destination, also accepts the config.show_path option
            ["e"] = "toggle_auto_expand_width",
            ["q"] = "close_window",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
          },
        },
      })
    end,
  },
}

return M.specs
