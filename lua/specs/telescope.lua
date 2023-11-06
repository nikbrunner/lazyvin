---@diagnostic disable: missing-fields
local M = {
  cmds = {},
  utils = {},
}

M.utils.delta_previewer = require("telescope.previewers").new_termopen_previewer({
  get_command = function(entry)
    -- this is for status
    -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
    -- just do an if and return a different command
    if entry.status == "??" or "A " then
      return {
        "git",
        "-c",
        "core.pager=delta",
        "-c",
        "delta.side-by-side=true",
        "diff",
        entry.value,
      }
    end

    -- note we can't use pipes
    -- this command is for git_commits and git_bcommits
    return {
      "git",
      "-c",
      "core.pager=delta",
      "-c",
      "delta.side-by-side=true",
      "diff",
      entry.value .. "^!",
    }
  end,
})

M.cmds.builtin = function(builtin, opts)
  return function()
    require("telescope.builtin")[builtin](opts or {})
  end
end

M.cmds.git_status = function()
  M.cmds.builtin("git_status", {
    previewer = M.utils.delta_previewer,
  })()
end

M.cmds.git_commits = function()
  M.cmds.builtin("git_commits", {
    previewer = M.utils.delta_previewer,
  })()
end

M.cmds.find_related_files = function()
  local utils = require("lib.utils")
  local current_filename = utils.get_current_filename(false)

  if current_filename then
    M.builtin("find_files", {
      default_text = current_filename,
    })()
  else
    M.builtin("find_files")()
  end
end

---@type LazySpec
M.spec = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "LukasPietzschmann/telescope-tabs",
  },
  keys = {
    {
      "<leader>fc",
      false,
    },
    {
      "<leader><space>",
      M.cmds.builtin("oldfiles", {
        only_cwd = true,
      }),
      desc = "Find Recent Files",
    },
    {
      "<leader>r",
      M.cmds.builtin("buffers"),
      desc = "Open buffers",
    },
    {
      "<leader>gs",
      M.cmds.git_status,
      desc = "Git Status",
    },
    {
      "<leader>gc",
      M.cmds.git_commits,
      desc = "Git Commit",
    },
    {
      "<leader>s<tab>",
      ":Telescope telescope-tabs list_tabs<CR>",
      desc = "List Tabs",
    },
  },
  opts = function(_, default_opts)
    local actions = require("telescope.actions")
    local merge = require("lib.utils").merge

    local quick_flex_window = {
      show_line = false,
      layout_strategy = "flex",
      layout_config = {
        width = 0.65,
        height = 0.65,
        preview_cutoff = 1,
        mirror = false,
        flip_columns = 125,
      },
    }

    ---@diagnostic disable-next-line: unused-local
    local quick_cursor_window = {
      show_line = false,
      theme = "cursor",
      initial_mode = "insert",
    }

    local no_preview = {
      previewer = false,
      prompt_title = false,
    }

    return merge({
      default_opts,
      {
        defaults = {
          path_display = { "truncate" },
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "descending",
          layout_strategy = "flex",
          layout_config = {
            horizontal = {
              height = 0.9,
              preview_cutoff = 0,
              prompt_position = "bottom",
              width = 0.8,
              preview_width = 0.5,
            },
            vertical = {
              height = 0.95,
              preview_height = 0.5,
              preview_cutoff = 0,
              prompt_position = "bottom",
              width = 0.8,
            },
            bottom_pane = {
              height = 25,
              preview_cutoff = 0,
              prompt_position = "top",
            },
            center = {
              height = 0.4,
              preview_cutoff = 0,
              prompt_position = "top",
              width = 0.5,
            },
            cursor = {
              height = 0.9,
              preview_cutoff = 40,
              width = 0.8,
            },
            width = 0.65,
            height = 0.65,
            preview_cutoff = 10,
          },

          mappings = {
            i = {
              ["<ESC>"] = actions.close,

              ["<C-l>"] = actions.cycle_history_next,
              ["<C-h>"] = actions.cycle_history_prev,

              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,

              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,

              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,

              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,

              ["<PageUp>"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,

              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
            },

            n = {
              ["q"] = actions.close,

              ["<C-h>"] = actions.cycle_history_next,
              ["<C-l>"] = actions.cycle_history_prev,

              ["j"] = actions.move_selection_next,
              ["k"] = actions.move_selection_previous,
              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,

              ["gg"] = actions.move_to_top,
              ["G"] = actions.move_to_bottom,

              ["<CR>"] = actions.select_default,
              ["x"] = actions.select_horizontal,
              ["v"] = actions.select_vertical,
              ["t"] = actions.select_tab,

              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,

              ["<PageUp>"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,

              ["?"] = actions.which_key,
            },
          },
        },

        pickers = {
          find_files = {
            hidden = true,
            file_ignore_patterns = { "^.git/", "^node_modules/" },
            show_line = false,
            theme = "ivy",
            initial_mode = "insert",
          },
          lsp_definitions = quick_flex_window,
          lsp_references = quick_flex_window,
          lsp_implementations = quick_flex_window,
          lsp_type_definitions = quick_flex_window,
          lsp_document_symbols = quick_flex_window,
          lsp_workspace_symbols = quick_flex_window,
          diagnostics = quick_flex_window,
          git_files = quick_flex_window,
          git_status = {
            theme = "ivy",
            initial_mode = "insert",
          },
          list_tabs = {
            theme = "dropdown",
            initial_mode = "insert",
          },
          buffers = vim.tbl_extend("keep", quick_flex_window, {
            initial_mode = "insert",
          }),
          current_buffer_fuzzy_find = {
            theme = "ivy",
          },
          spell_suggest = {
            theme = "cursor",
          },
          colorscheme = {
            theme = "dropdown",
            enable_preview = true,
          },
          oldfiles = quick_flex_window,
          commands = {
            theme = "ivy",
          },
        },
      },
    })
  end,
  config = function(_, opts)
    local telescope = require("telescope")

    telescope.setup(opts)
    telescope.load_extension("telescope-tabs")
  end,
}

return M.spec
