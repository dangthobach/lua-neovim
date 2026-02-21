return {
  {
    "mrjones2014/smart-splits.nvim",
    -- DO NOT lazy-load: WezTerm integration requires IS_NVIM user var set on startup
    lazy = false,
    opts = {
      ignored_filetypes = { "nofile", "quickfix", "prompt" },
      ignored_buftypes = { "NvimTree" },
      default_amount = 3,
      at_edge = "stop",
      -- WezTerm multiplexer integration
      multiplexer_integration = "wezterm",
    },
    keys = {
      -- Navigate splits (seamless with WezTerm panes via Ctrl+hjkl)
      { "<C-h>", function() require("smart-splits").move_cursor_left() end, desc = "Move Left" },
      { "<C-j>", function() require("smart-splits").move_cursor_down() end, desc = "Move Down" },
      { "<C-k>", function() require("smart-splits").move_cursor_up() end, desc = "Move Up" },
      { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "Move Right" },

      -- Resize splits (seamless with WezTerm panes via Alt+hjkl)
      { "<A-h>", function() require("smart-splits").resize_left() end, desc = "Resize Left" },
      { "<A-j>", function() require("smart-splits").resize_down() end, desc = "Resize Down" },
      { "<A-k>", function() require("smart-splits").resize_up() end, desc = "Resize Up" },
      { "<A-l>", function() require("smart-splits").resize_right() end, desc = "Resize Right" },

      -- Swap buffers between splits
      { "<leader>wh", function() require("smart-splits").swap_buf_left() end, desc = "Swap Left" },
      { "<leader>wj", function() require("smart-splits").swap_buf_down() end, desc = "Swap Down" },
      { "<leader>wk", function() require("smart-splits").swap_buf_up() end, desc = "Swap Up" },
      { "<leader>wl", function() require("smart-splits").swap_buf_right() end, desc = "Swap Right" },
    },
  },
}
