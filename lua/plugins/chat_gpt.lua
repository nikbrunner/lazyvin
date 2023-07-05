-- NOTE: Usage & Billing: https://platform.openai.com/account/usage
-- API Key is stored in 1Password and is set as a Environment Variable
-- API Key is exposed via `.zshenv` to prevent commiting it to dotfiles repo

local M = {}

---@type LazySpec
M.spec = {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  ---@type LazyKeys[]
  keys = {
    {
      "<leader>cii",
      "<cmd>ChatGPT<CR>",
      {
        desc = "ChatGPT",
      },
    },
    {
      "<leader>cie",
      "<cmd>ChatGPTEditWithInstructions<CR>",
      {
        desc = "ChatGPT Edit",
      },
    },
  },
  opts = {
    yank_register = "+",
    edit_with_instructions = {
      diff = true,
      keymaps = {
        close = { "<C-c>", "q", "<ESC>" },
        accept = "<C-y>",
        toggle_diff = "<C-d>",
        toggle_settings = "<C-o>",
        cycle_windows = "<Tab>",
        use_output_as_input = "<C-i>",
      },
    },
    chat = {
      welcome_message = "Hi Nik, how can I help you today?",
      loading_text = "Loading, please wait ...",
      question_sign = "", -- 🙂
      answer_sign = "ﮧ", -- 🤖
      max_line_length = 120,
      sessions_window = {
        border = {
          style = "rounded",
          text = {
            top = " Sessions ",
          },
        },
        win_options = {
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
      },
      keymaps = {
        close = { "<C-c>", "q", "<ESC>" },
        yank_last = "<C-y>",
        yank_last_code = "<C-k>",
        scroll_up = "<C-u>",
        scroll_down = "<C-d>",
        new_session = "<C-n>",
        cycle_windows = "<Tab>",
        cycle_modes = "<C-f>",
        select_session = "<Space>",
        rename_session = "r",
        delete_session = "d",
        draft_message = "<C-d>",
        toggle_settings = "<C-o>",
        toggle_message_role = "<C-r>",
        toggle_system_role_open = "<C-s>",
      },
    },
    popup_layout = {
      relative = "editor",
      position = "50%",
      size = {
        height = "80%",
        width = "80%",
      },
    },
    popup_window = {
      filetype = "chatgpt",
      border = {
        highlight = "FloatBorder",
        style = "rounded",
        text = {
          top = " ChatGPT ",
        },
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
    },
    popup_input = {
      prompt = "  ",
      border = {
        highlight = "FloatBorder",
        style = "rounded",
        text = {
          top_align = "center",
          top = " Prompt ",
        },
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
      submit = "<C-s>",
    },
    settings_window = {
      border = {
        style = "rounded",
        text = {
          top = " Settings ",
        },
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
    },
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
      model = "code-davinci-edit-001",
      temperature = 0,
      top_p = 1,
      n = 1,
    },
    actions_paths = {},
    predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv",
  },
  config = function(_, opts)
    require("chatgpt").setup(opts)
  end,
}

return M.spec