-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- ── Workflow: Quick Panels ───────────────────────────────────
-- Close all floating windows (clean workspace)
map("n", "<leader>wc", function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= "" then
      vim.api.nvim_win_close(win, false)
    end
  end
end, { desc = "Close All Floats" })

-- ── Quick Layout: Code + Horizontal Terminal ─────────────────
map("n", "<leader>wt", function()
  vim.cmd("only")  -- close all splits
  vim.cmd("ToggleTerm direction=horizontal")
end, { desc = "Layout: Code + Terminal" })

-- ── Diagnostics Shortcuts ────────────────────────────────────
map("n", "<leader>xq", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics" })

-- ── Better fold navigation ───────────────────────────────────
map("n", "zR", function() vim.cmd("normal! zR") end, { desc = "Open All Folds" })
map("n", "zM", function() vim.cmd("normal! zM") end, { desc = "Close All Folds" })
