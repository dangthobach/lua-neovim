return {
  -- ────────────────────────────────────────────────────────────
  -- Auto-close brackets, quotes, etc.
  -- ────────────────────────────────────────────────────────────
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true, -- dùng treesitter để nhận biết chuỗi/comment
    },
    config = function(_, opts)
      local autopairs = require("nvim-autopairs")
      autopairs.setup(opts)

      -- Tích hợp với nvim-cmp (nếu có): tự thêm () sau khi cmp chọn function
      local ok, cmp = pcall(require, "cmp")
      if ok then
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end
    end,
  },

  -- ────────────────────────────────────────────────────────────
  -- Surround: thêm/sửa/xóa cặp ký tự bao quanh
  -- ────────────────────────────────────────────────────────────
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    version = "*",
    opts = {},
    -- Keymaps mặc định (Normal mode):
    --   ys{motion}{char}  → Thêm surround    vd: ysiw" → bao word bằng ""
    --   cs{old}{new}      → Đổi surround      vd: cs"' → đổi "" thành ''
    --   ds{char}          → Xóa surround      vd: ds" → xóa ""
    -- Visual mode:
    --   S{char}           → Bao vùng chọn    vd: S) → bao selection bằng ()
  },

  -- ────────────────────────────────────────────────────────────
  -- Comment: comment/uncomment nhanh có hỗ trợ treesitter
  -- ────────────────────────────────────────────────────────────
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {
      -- Thêm khoảng trắng sau dấu comment (vd: -- thay vì --)
      padding = true,
      -- Giữ cursor khi comment dòng
      sticky = true,
    },
    -- Keymaps mặc định:
    --   gcc      → Comment/uncomment dòng hiện tại
    --   gbc      → Block comment dòng hiện tại
    --   gc{motion} → Comment theo motion  vd: gc5j → comment 5 dòng xuống
    --   gb{motion} → Block comment theo motion
    -- Visual mode:
    --   gc       → Comment vùng chọn
    --   gb       → Block comment vùng chọn
  },

  -- ────────────────────────────────────────────────────────────
  -- ToggleTerm: terminal tích hợp với nhiều layout
  -- ────────────────────────────────────────────────────────────
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-\\>", desc = "Toggle Terminal" },
      { "<leader>tf", desc = "Terminal Float" },
      { "<leader>th", desc = "Terminal Horizontal" },
      { "<leader>tv", desc = "Terminal Vertical" },
      { "<leader>tg", desc = "LazyGit (toggleterm)" },
    },
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return math.floor(vim.o.columns * 0.4)
          end
        end,
        open_mapping = [[<C-\>]], -- Ctrl+\ để toggle terminal
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,  -- Ctrl+\ hoạt động trong insert mode
        terminal_mappings = true,
        persist_size = true,
        direction = "float",     -- mặc định: float
        close_on_exit = true,
        float_opts = {
          border = "curved",
          winblend = 3,
        },
      })

      -- Keymaps bổ sung
      local map = vim.keymap.set
      map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Terminal Float" })
      map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Terminal Horizontal" })
      map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Terminal Vertical" })

      -- Thoát terminal mode bằng Esc hoặc jk
      map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
      map("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

      -- LazyGit trong toggleterm (nếu có lazygit CLI)
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        float_opts = { border = "curved" },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
      })
      map("n", "<leader>tg", function() lazygit:toggle() end, { desc = "LazyGit (toggleterm)" })
    end,
  },
}
