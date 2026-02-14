return {
  -- Kulala.nvim: Test APIs (alternative to Rest.nvim without luarocks dependency)
  {
    "mistweaverco/kulala.nvim",
    opts = {},
    keys = {
      { "<leader>rr", function() require("kulala").run() end, desc = "Run Request (Kulala)" },
      { "<leader>rl", function() require("kulala").replay() end, desc = "Re-run Last Request (Kulala)" },
      { "<leader>rp", function() require("kulala").scratchpad() end, desc = "Preview Request / Scratchpad" },
      { "<leader>rn", function() require("kulala").jump_next() end, desc = "Jump to Next Request" },
      { "<leader>rN", function() require("kulala").jump_prev() end, desc = "Jump to Previous Request" },
    },
  },

  -- Vim-Dadbod: Database Management
  {
    "tpope/vim-dadbod",
    dependencies = {
      {
        "kristijanhusak/vim-dadbod-ui",
        config = function()
          vim.g.db_ui_save_location = vim.fn.stdpath("config") .. require("plenary.path").path.sep .. "db_ui"
          vim.g.db_ui_use_nerd_fonts = 1
        end,
      },
      {
        "kristijanhusak/vim-dadbod-completion",
        ft = { "sql", "mysql", "plsql" },
        init = function()
          vim.api.nvim_create_autocmd("FileType", {
            pattern = { "sql", "mysql", "plsql" },
            callback = function()
              local cmp = require("cmp")
              local sources = cmp.get_config().sources
              table.insert(sources, { name = "vim-dadbod-completion" })
              cmp.setup.buffer({ sources = sources })
            end,
          })
        end,
      },
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    keys = {
      { "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Toggle DB UI" },
    },
  },
}
