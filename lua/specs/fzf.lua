---@diagnostic disable: missing-fields
local M = {}

M.FOLDER_PRESETS = {
  nvim = "~/.config/nvim",
  config = "~/.config",
}

M.search_preset_folder = function()
  vim.cmd("Neotree close")

  local choices = {}

  for key, _ in pairs(M.FOLDER_PRESETS) do
    table.insert(choices, key)
  end

  vim.ui.select(choices, {
    prompt = "Pick a folder: ",
    format_item = function(choice)
      return " " .. choice
    end,
  }, function(choice)
    M.fzf("files", {
      winopts = M.win_presets.medium.vertical,
      cwd = M.FOLDER_PRESETS[choice],
    })()
  end)
end

M.win_presets = {
  small = {
    no_preview = {
      height = 0.35,
      width = 0.65,
      preview = {
        hidden = "hidden",
      },
    },
  },
  medium = {
    flex = {
      height = 0.75,
      width = 0.75,
      preview = {
        layout = "flex",
      },
    },
    vertical = {
      height = 0.75,
      width = 0.75,
      preview = {
        layout = "vertical",
        vertical = "up:65%",
      },
    },
  },
  large = {
    vertical = {
      height = 0.9,
      width = 0.9,
      preview = {
        layout = "vertical",
        vertical = "up:65%",
      },
    },
  },
  full = {
    vertical = {
      fullscreen = true,
      preview = {
        layout = "vertical",
        vertical = "down:75%",
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
  lazy = false,
  enabled = false,
  priority = 200,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<leader><space>",
      M.fzf("oldfiles", {
        winopts = M.win_presets.medium.vertical,
      }),
      desc = "Files",
    },
    {
      "<leader>ff",
      M.fzf("files", {
        winopts = M.win_presets.medium.vertical,
      }),
      desc = "Files",
    },
    {
      "<leader>gs",
      M.fzf("git_status", {
        winopts = M.win_presets.large.vertical,
      }),
      desc = "Git Status",
    },
    {
      "<leader>gc",
      M.fzf("git_commits", {
        winopts = M.win_presets.large.vertical,
      }),
      desc = "Git Commits",
    },
    {
      "<leader>f/",
      M.search_preset_folder,
      desc = "Preset folders",
    },
    {
      "<leader>fr",
      M.fzf("oldfiles", {
        winopts = M.win_presets.medium.vertical,
      }),
      desc = "Recent Files (Current Session)",
    },
    {
      "<leader>fR",
      M.fzf("oldfiles", {
        winopts = M.win_presets.medium.vertical,
        include_current_session = false,
      }),
      desc = "Recent Files (All Sessions)",
    },
    {
      "<leader>ss",
      M.fzf("lsp_document_symbols", {
        winopts = M.win_presets.medium.flex,
      }),
      desc = "Document Symbols",
    },
    {
      "<leader>sS",
      M.fzf("lsp_live_workspace_symbols", {
        winopts = M.win_presets.medium.flex,
      }),
      desc = "Workspace Symbols",
    },
    {
      "<leader>/",
      M.fzf("lgrep_curbuf", {
        winopts = M.win_presets.large.vertical,
      }),
      desc = "Grep",
    },
    {
      "<leader>sg",
      M.fzf("live_grep_native", {
        winopts = M.win_presets.large.vertical,
      }),
      desc = "Grep",
    },
  },
  opts = function()
    local actions = require("fzf-lua.actions")
    return {
      global_resume = true, -- enable global `resume`?
      global_resume_query = true, -- include typed query in `resume`?
      winopts = {
        height = 0.50, -- window height
        width = 0.75, -- window width
        row = 0.35, -- window row position (0=top, 1=bottom)
        col = 0.50, -- window col position (0=left, 1=right)
        border = "rounded",
        hl = {
          normal = "NeoTreeNormal", -- window normal color (fg+bg)
          border = "FloatBorder", -- border color
          help_border = "FloatBorder", -- <F1> window border
        },
        preview = {
          default = "bat",
          border = "noborder", -- border|noborder, applies only to
          wrap = "nowrap", -- wrap|nowrap
          hidden = "nohidden", -- hidden|nohidden
          vertical = "down:45%", -- up|down:size
          horizontal = "right:60%", -- right|left:size
          layout = "flex", -- horizontal|vertical|flex
          flip_columns = 120, -- #cols to switch to horizontal on flex
          title = true, -- preview border title (file/buf)?
          scrollbar = false, -- `false` or string:'float|border'
          scrolloff = "-2", -- float scrollbar offset from right
          scrollchars = { "", "" }, -- scrollbar chars ({ <full>, <empty> }
          delay = 100, -- delay(ms) displaying the preview
          winopts = { -- builtin previewer window options
            number = false,
            relativenumber = false,
            cursorline = true,
            cursorlineopt = "both",
            cursorcolumn = false,
            signcolumn = "no",
            list = false,
            foldenable = false,
            foldmethod = "manual",
          },
        },
        on_create = function()
          vim.cmd("Neotree close")
          -- called once upon creation of the fzf main window
          -- can be used to add custom fzf-lua mappings, e.g:
          vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
          vim.keymap.set("t", "<C-k>", "<Up>", { silent = true, buffer = true })
        end,
      },
      keymap = {
        builtin = {
          ["<F1>"] = "toggle-help",
          ["<F2>"] = "toggle-fullscreen",

          ["<F3>"] = "toggle-preview-wrap",
          ["<F4>"] = "toggle-preview",
          ["<F5>"] = "toggle-preview-ccw",
          ["<F6>"] = "toggle-preview-cw",

          ["<C-d>"] = "preview-page-down",
          ["<C-u>"] = "preview-page-up",
        },
        fzf = {
          ["ctrl-c"] = "abort",
          ["ctrl-a"] = "toggle-all",
          ["ctrl-q"] = "select-all+accept",
          ["f3"] = "toggle-preview-wrap",
          ["f4"] = "toggle-preview",
        },
      },
      fzf_opts = {
        -- options are sent as `<left>=<right>`
        -- set to `false` to remove a flag
        -- set to '' for a non-value flag
        -- for raw args use `fzf_args` instead
        ["--ansi"] = "",
        ["--prompt"] = "  ",
        ["--info"] = "inline",
        ["--height"] = "100%",
        ["--layout"] = "reverse",
        ["--keep-right"] = "",
      },
      previewers = {
        cat = {
          cmd = "cat",
          args = "--number",
        },
        bat = {
          cmd = "bat",
          args = "--style=numbers,changes --color always",
          theme = "base16", -- bat preview theme (bat --list-themes)
          config = nil, -- nil uses $BAT_CONFIG_PATH
        },
        head = {
          cmd = "head",
          args = nil,
        },
        git_diff = {
          cmd_deleted = "git diff --color HEAD --",
          cmd_modified = "git diff --color HEAD",
          cmd_untracked = "git diff --color --no-index /dev/null",
          pager = "delta --width $FZF_PREVIEW_COLUMNS",
        },
        man = {
          cmd = "man -c %s | col -bx",
        },
        builtin = {
          syntax = true, -- preview syntax highlight?
          syntax_limit_l = 0, -- syntax limit (lines), 0=nolimit
          syntax_limit_b = 1024 * 1024, -- syntax limit (bytes), 0=nolimit
        },
      },
      -- provider setup
      files = {
        prompt = "Find File❯ ",
        multiprocess = true, -- run command in a separate process
        git_icons = true, -- show git icons?
        file_icons = true, -- show file icons?
        color_icons = true, -- colorize file|git icons
        find_opts = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
        rg_opts = "--color=never --files --hidden --follow -g '!.git'",
        fd_opts = "--color=never --type f --hidden --follow --exclude .git",
        actions = {
          ["default"] = actions.file_edit_or_qf,
          ["ctrl-s"] = actions.file_split,
          ["ctrl-v"] = actions.file_vsplit,
          ["ctrl-t"] = actions.file_tabedit,
          ["ctrl-q"] = actions.file_sel_to_qf,
          ["ctrl-y"] = function(selected)
            print(selected[1])
          end,
        },
      },
      git = {
        files = {
          prompt = "Git Files❯ ",
          cmd = "git ls-files --exclude-standard",
          multiprocess = false, -- run command in a separate process
          git_icons = true, -- show git icons?
          file_icons = true, -- show file icons?
          color_icons = true, -- colorize file|git icons
        },
        status = {
          prompt = "Modified Files❯ ",
          cmd = "git status -su",
          previewer = "git_diff",
          file_icons = true,
          git_icons = true,
          color_icons = true,
          actions = {
            ["default"] = actions.file_edit_or_qf,
            ["ctrl-s"] = actions.file_split,
            ["ctrl-v"] = actions.file_vsplit,
            ["ctrl-t"] = actions.file_tabedit,
            ["ctrl-q"] = actions.file_sel_to_qf,
            ["right"] = { actions.git_unstage, actions.resume },
            ["left"] = { actions.git_stage, actions.resume },
          },
        },
        commits = {
          prompt = "Commits❯ ",
          cmd = "git log --pretty=oneline --abbrev-commit --color",
          preview = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
          actions = {
            ["default"] = actions.git_checkout,
          },
        },
        bcommits = {
          prompt = "BCommits❯ ",
          cmd = "git log --pretty=oneline --abbrev-commit --color",
          preview = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
          actions = {
            ["default"] = actions.git_buf_edit,
            ["ctrl-s"] = actions.git_buf_split,
            ["ctrl-v"] = actions.git_buf_vsplit,
            ["ctrl-t"] = actions.git_buf_tabedit,
          },
        },
        branches = {
          prompt = "Branches❯ ",
          cmd = "git branch --all --color",
          preview = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
          actions = {
            ["default"] = actions.git_switch,
          },
        },
        icons = {
          ["M"] = { icon = "M", color = "yellow" },
          ["D"] = { icon = "D", color = "red" },
          ["A"] = { icon = "A", color = "green" },
          ["R"] = { icon = "R", color = "yellow" },
          ["C"] = { icon = "C", color = "yellow" },
          ["?"] = { icon = "?", color = "magenta" },
        },
      },
      grep = {
        prompt = "Grep Text❯ ",
        input_prompt = "Grep For❯ ",
        multiprocess = true, -- run command in a separate process
        git_icons = true, -- show git icons?
        file_icons = true, -- show file icons?
        color_icons = true, -- colorize file|git icons
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512",
        grep_opts = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp",
        -- 'live_grep_glob' options:
        glob_flag = "--iglob", -- for case sensitive globs use '--glob'
        glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
      },
      args = {
        prompt = "Args❯ ",
        files_only = true,
        -- added on top of regular file actions
        actions = { ["ctrl-x"] = actions.arg_del },
      },
      oldfiles = {
        prompt = "History❯ ",
        cwd_only = true,
        stat_file = true, -- verify files exist on disk
        include_current_session = true, -- include bufs from current session
      },
      buffers = {
        prompt = "Buffers❯ ",
        file_icons = true, -- show file icons?
        color_icons = true, -- colorize file|git icons
        sort_lastused = true, -- sort buffers() by last used
        cwd_only = true, -- buffers for the cwd only
        cwd = nil, -- buffers list for a given dir
        actions = {
          ["ctrl-x"] = { actions.buf_del, actions.resume },
        },
      },
      lines = {
        previewer = "builtin", -- set to 'false' to disable
        prompt = "Lines❯ ",
        show_unlisted = false, -- exclude 'help' buffers
        no_term_buffers = true, -- exclude 'term' buffers
        fzf_opts = {
          -- do not include bufnr in fuzzy matching
          -- tiebreak by line no.
          ["--delimiter"] = vim.fn.shellescape("]"),
          ["--nth"] = "2..",
          ["--tiebreak"] = "index",
        },
        actions = {
          ["default"] = actions.buf_edit,
          ["ctrl-s"] = actions.buf_split,
          ["ctrl-v"] = actions.buf_vsplit,
          ["ctrl-t"] = actions.buf_tabedit,
        },
      },
      blines = {
        previewer = "builtin", -- set to 'false' to disable
        prompt = "BLines❯ ",
        show_unlisted = true, -- include 'help' buffers
        no_term_buffers = false, -- include 'term' buffers
        fzf_opts = {
          -- hide filename, tiebreak by line no.
          ["--delimiter"] = vim.fn.shellescape("[:]"),
          ["--with-nth"] = "2..",
          ["--tiebreak"] = "index",
        },
        actions = {
          ["default"] = actions.buf_edit,
          ["ctrl-s"] = actions.buf_split,
          ["ctrl-v"] = actions.buf_vsplit,
          ["ctrl-t"] = actions.buf_tabedit,
        },
      },
      colorschemes = {
        prompt = "Colorschemes❯ ",
        live_preview = true, -- apply the colorscheme on preview?
        actions = { ["default"] = actions.colorscheme },
        winopts = { height = 0.55, width = 0.30 },
      },
      quickfix = {
        file_icons = true,
        git_icons = true,
      },
      lsp = {
        prompt_postfix = "❯ ", -- will be appended to the LSP label
        cwd_only = true, -- LSP/diagnostics for cwd only?
        async_or_timeout = 5000, -- timeout(ms) or 'true' for async calls
        file_icons = true,
        git_icons = true,
        symbols = {
          async_or_timeout = true, -- symbols are async by default
          symbol_style = 1, -- style for document/workspace symbols
          symbol_hl_prefix = "CmpItemKind",
          symbol_fmt = function(s)
            return "[" .. s .. "]"
          end,
        },
        code_actions = {
          prompt = "Code Actions> ",
          ui_select = true, -- use 'vim.ui.select'?
          async_or_timeout = 5000,
          winopts = {
            row = 0.40,
            height = 0.35,
            width = 0.60,
          },
        },
      },
      file_icon_padding = "",
      file_icon_colors = {
        ["lua"] = "blue",
      },
    }
  end,
  config = function(_, opts)
    require("fzf-lua").setup(opts)
  end,
}

return M.spec