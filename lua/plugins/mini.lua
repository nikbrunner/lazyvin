local M = {}

---@type LazySpec
M.specs = {
  {
    "echasnovski/mini.hues",
    version = "*",
  },
  {
    "echasnovski/mini.pick",
    keys = {
      {
        "<leader>ff",
        function()
          require("mini.pick").builtin.files({ tool = "git" })
        end,
        desc = "Find Files",
      },
    },
    opts = {
      mappings = {
        caret_left = "<Left>",
        caret_right = "<Right>",

        choose = "<CR>",
        choose_in_split = "<C-s>",
        choose_in_tabpage = "<C-t>",
        choose_in_vsplit = "<C-v>",
        choose_marked = "<M-CR>",

        delete_char = "<BS>",
        delete_char_right = "<Del>",
        delete_left = "<C-u>",
        delete_word = "<C-w>",

        mark = "<C-x>",
        mark_all = "<C-a>",

        move_down = "<C-j>",
        move_start = "<C-g>",
        move_up = "<C-k>",

        paste = "<C-r>",

        refine = "<C-Space>",
        refine_marked = "<M-Space>",

        scroll_down = "<C-f>",
        scroll_left = "<C-h>",
        scroll_right = "<C-l>",
        scroll_up = "<C-b>",

        stop = "<Esc>",

        toggle_info = "<S-Tab>",
        toggle_preview = "<Tab>",
      },
    },
    config = function(_, opts)
      require("mini.pick").setup(opts)
    end,
  },
}

return M.specs
