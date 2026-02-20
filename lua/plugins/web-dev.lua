return {
  -- Kulala.nvim: Test APIs (alternative to Rest.nvim without luarocks dependency)
  {
    "mistweaverco/kulala.nvim",
    opts = {
      default_view = "body",
      split_direction = "horizontal",
    },
    keys = {
      { "<leader>rr", function() require("kulala").run() end, desc = "Run Request (Kulala)" },
      { "<leader>rl", function() require("kulala").replay() end, desc = "Re-run Last Request" },
      { "<leader>rp", function() require("kulala").scratchpad() end, desc = "Scratchpad" },
      { "<leader>rn", function() require("kulala").jump_next() end, desc = "Next Request" },
      { "<leader>rN", function() require("kulala").jump_prev() end, desc = "Prev Request" },
      { "<leader>re", function() require("kulala").set_selected_env() end, desc = "Select Environment" },
      { "<leader>ri", function() require("kulala").inspect() end, desc = "Inspect Request" },
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
      { "<leader>da", "<cmd>DBUIAddConnection<cr>", desc = "Add DB Connection" },
      { "<leader>df", "<cmd>DBUIFindBuffer<cr>", desc = "Find DB Buffer" },
    },
  },
}
