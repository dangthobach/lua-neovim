return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-\\>", desc = "Toggle Terminal (Float)" },
      { "<leader>tt", desc = "Toggle Terminal (Float)" },
      { "<leader>th", desc = "Toggle Terminal (Horizontal)" },
      { "<leader>tv", desc = "Toggle Terminal (Vertical)" },
      { "<leader>tg", desc = "Lazygit" },
      { "<leader>tl", desc = "Live Log Tail" },
    },
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = "<C-\\>",
      direction = "float",
      float_opts = {
        border = "curved",
        width = function() return math.floor(vim.o.columns * 0.85) end,
        height = function() return math.floor(vim.o.lines * 0.8) end,
        winblend = 3,
      },
      shade_terminals = true,
      shading_factor = 2,
      persist_size = true,
      persist_mode = true,
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      local Terminal = require("toggleterm.terminal").Terminal

      -- Lazygit terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = {
          border = "curved",
          width = function() return math.floor(vim.o.columns * 0.95) end,
          height = function() return math.floor(vim.o.lines * 0.95) end,
        },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
      })

      -- Log tail terminal (reusable)
      local logtail = Terminal:new({
        direction = "horizontal",
        close_on_exit = false,
        on_open = function()
          vim.cmd("startinsert!")
        end,
      })

      -- Keymaps
      local map = vim.keymap.set

      map("n", "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", { desc = "Terminal (Float)" })
      map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Terminal (Horizontal)" })
      map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Terminal (Vertical)" })

      map("n", "<leader>tg", function() lazygit:toggle() end, { desc = "Lazygit" })
      map("n", "<leader>tl", function() logtail:toggle() end, { desc = "Log Terminal" })

      -- Terminal mode: Esc to go to normal mode, double Esc to exit
      map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })

      -- Navigate between terminal and editor splits
      map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move to Left Split" })
      map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Move to Below Split" })
      map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Move to Above Split" })
      map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Move to Right Split" })
    end,
  },
}
