return {
  {
    "mrjones2014/smart-splits.nvim",
    event = "VeryLazy",
    opts = {
      ignored_filetypes = { "nofile", "quickfix", "prompt" },
      ignored_buftypes = { "NvimTree" },
      default_amount = 3,
      at_edge = "wrap",
    },
    keys = {
      -- Resize splits with Alt + hjkl
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
