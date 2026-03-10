return {
  -- ════════════════════════════════════════════════════════════
  -- ZEN MODE — Distraction-free coding
  -- ════════════════════════════════════════════════════════════
  {
    "folke/zen-mode.nvim",
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    },
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          laststatus = 0,
        },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        tmux = { enabled = false },
        wezterm = {
          enabled = true,
          font = "+2", -- tăng font size khi zen
        },
      },
      on_open = function()
        vim.notify("🧘 Zen Mode — Focus!", vim.log.levels.INFO)
      end,
      on_close = function()
        vim.notify("⚡ Back to work!", vim.log.levels.INFO)
      end,
    },
  },

  -- ════════════════════════════════════════════════════════════
  -- TWILIGHT — Dim inactive code blocks
  -- ════════════════════════════════════════════════════════════
  {
    "folke/twilight.nvim",
    keys = {
      { "<leader>Z", "<cmd>Twilight<cr>", desc = "Twilight (Dim Inactive)" },
    },
    opts = {
      dimming = {
        alpha = 0.25,
        color = { "Normal", "#ffffff" },
        term_bg = "#000000",
        inactive = false,
      },
      context = 15,       -- số dòng context xung quanh cursor
      treesitter = true,   -- dùng treesitter cho accuracy
      expand = {
        "function",
        "method",
        "table",
        "if_statement",
        "for_statement",
      },
    },
  },

  -- ════════════════════════════════════════════════════════════
  -- NEOSCROLL — Smooth scrolling
  -- ════════════════════════════════════════════════════════════
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {
      mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
      easing_function = "sine",   -- easing mượt: sine, quadratic, cubic, quartic, quintic, circular
      pre_hook = nil,
      post_hook = nil,
      performance_mode = false,   -- tắt performance_mode để giữ smoothness
    },
  },
}
