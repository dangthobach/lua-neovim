-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- ── Workflow: Quick Panels ───────────────────────────────────
-- Close all floating windows (clean workspace)
-- Using <leader>Wc to avoid conflict with LazyVim's <leader>w (window prefix)
map("n", "<leader>Wc", function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= "" then
      vim.api.nvim_win_close(win, false)
    end
  end
end, { desc = "Close All Floats" })

-- ── Layout Switching ─────────────────────────────────────────
-- Layout 1: Coding (neo-tree + horizontal terminal)
map("n", "<leader>L1", function()
  vim.cmd("only")
  vim.schedule(function()
    pcall(vim.cmd, "Neotree filesystem reveal left")
    vim.schedule(function()
      vim.cmd("wincmd l")
      pcall(vim.cmd, "ToggleTerm direction=horizontal")
      vim.cmd("wincmd k")
    end)
  end)
end, { desc = "Layout: Coding" })

-- Layout 2: Database (DBUI sidebar)
map("n", "<leader>L2", function()
  vim.cmd("only")
  vim.schedule(function()
    pcall(vim.cmd, "DBUI")
  end)
end, { desc = "Layout: Database" })

-- Layout 3: API Testing (neo-tree + ready for .http files)
map("n", "<leader>L3", function()
  vim.cmd("only")
  vim.schedule(function()
    pcall(vim.cmd, "Neotree filesystem reveal left")
    vim.schedule(function()
      vim.cmd("wincmd l")
    end)
  end)
end, { desc = "Layout: API Testing" })

-- Layout 4: Spring Boot (code + vertical terminal for mvn)
map("n", "<leader>L4", function()
  vim.cmd("only")
  vim.schedule(function()
    pcall(vim.cmd, "2ToggleTerm direction=vertical")
    vim.cmd("wincmd h")
  end)
end, { desc = "Layout: Spring Boot" })

-- ── Quick Layout: Code + Horizontal Terminal ─────────────────
map("n", "<leader>Wt", function()
  vim.cmd("only")
  vim.schedule(function()
    pcall(vim.cmd, "ToggleTerm direction=horizontal")
  end)
end, { desc = "Layout: Code + Terminal" })

-- ── Diagnostics Shortcuts ────────────────────────────────────
map("n", "<leader>xq", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics" })

-- ── Better fold navigation ───────────────────────────────────
map("n", "zR", function() vim.cmd("normal! zR") end, { desc = "Open All Folds" })
map("n", "zM", function() vim.cmd("normal! zM") end, { desc = "Close All Folds" })

-- ── Session Management (persistence.nvim) ────────────────────
map("n", "<leader>qs", function() require("persistence").load() end, { desc = "Restore Session" })
map("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Restore Last Session" })
map("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Don't Save Session" })
