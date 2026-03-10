return {
  -- ════════════════════════════════════════════════════════════
  -- 1. LUALINE — Premium statusline override
  -- ════════════════════════════════════════════════════════════
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local icons = LazyVim.config.icons

      -- Rounded separators cho feel premium
      opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      })

      -- Section A: Mode (đã có style tự động theo theme)
      opts.sections = opts.sections or {}

      opts.sections.lualine_a = { { "mode" } }

      -- Section B: Branch + Diff
      opts.sections.lualine_b = {
        { "branch", icon = "" },
        {
          "diff",
          symbols = {
            added = icons.git.added,
            modified = icons.git.modified,
            removed = icons.git.removed,
          },
        },
      }

      -- Section C: Filename + diagnostics + search count
      opts.sections.lualine_c = {
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        {
          LazyVim.lualine.pretty_path(),
          -- color = function()
          --   return vim.bo.modified and { fg = "#f7768e" } or nil
          -- end,
        },
        -- Macro recording indicator
        {
          function()
            local reg = vim.fn.reg_recording()
            if reg ~= "" then
              return " REC @" .. reg
            end
            return ""
          end,
          color = { fg = "#ff9e64" },
        },
        -- Search count
        {
          function()
            if vim.v.hlsearch == 0 then
              return ""
            end
            local ok, result = pcall(vim.fn.searchcount, { maxcount = 999 })
            if not ok or result.total == 0 then
              return ""
            end
            return string.format(" %d/%d", result.current, result.total)
          end,
          color = { fg = "#7dcfff" },
        },
      }

      -- Section X: Encoding, filetype
      opts.sections.lualine_x = {
        -- LSP server name
        {
          function()
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            if #clients == 0 then
              return "No LSP"
            end
            local names = {}
            for _, client in ipairs(clients) do
              table.insert(names, client.name)
            end
            return " " .. table.concat(names, ", ")
          end,
          color = { fg = "#9ece6a" },
        },
        -- Encoding (chỉ hiện nếu không phải utf-8)
        {
          function()
            local enc = vim.opt.fileencoding:get()
            if enc ~= "utf-8" then
              return enc:upper()
            end
            return ""
          end,
        },
        -- File format (chỉ hiện nếu không phải unix)
        {
          function()
            local ff = vim.bo.fileformat
            if ff ~= "unix" then
              return ff:upper()
            end
            return ""
          end,
          color = { fg = "#e0af68" },
        },
      }

      -- Section Y: Progress
      opts.sections.lualine_y = {
        {
          "progress",
          separator = " ",
          padding = { left = 1, right = 0 },
        },
        {
          "location",
          padding = { left = 0, right = 1 },
        },
      }

      -- Section Z: Clock
      opts.sections.lualine_z = {
        {
          function()
            return " " .. os.date("%H:%M")
          end,
        },
      }

      return opts
    end,
  },

  -- ════════════════════════════════════════════════════════════
  -- 2. BUFFERLINE — Slant tabs + diagnostics
  -- ════════════════════════════════════════════════════════════
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        style_preset = require("bufferline").style_preset.minimal,
        indicator = { style = "underline" },
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        show_close_icon = false,
        show_buffer_close_icons = true,
        separator_style = "slant",
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "neo-tree",
            text = " File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },

  -- ════════════════════════════════════════════════════════════
  -- 3. INDENT-BLANKLINE — Rainbow indent + scope highlight
  -- ════════════════════════════════════════════════════════════
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "LazyFile",
    config = function()
      -- Rainbow colors cho indent levels
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      require("ibl").setup({
        indent = {
          highlight = highlight,
          char = "│",
        },
        scope = {
          enabled = true,
          show_start = true,
          show_end = false,
        },
      })
    end,
  },

  -- ════════════════════════════════════════════════════════════
  -- 4. SCROLLBAR — Diagnostics + search marks
  -- ════════════════════════════════════════════════════════════
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    opts = {
      show_in_active_only = true,
      handle = {
        blend = 30,
        highlight = "Visual",
      },
      marks = {
        Search = { highlight = "Search" },
        Error = { highlight = "DiagnosticError" },
        Warn = { highlight = "DiagnosticWarn" },
        Info = { highlight = "DiagnosticInfo" },
        Hint = { highlight = "DiagnosticHint" },
        Misc = { highlight = "Normal" },
        GitAdd = { highlight = "GitSignsAdd" },
        GitChange = { highlight = "GitSignsChange" },
        GitDelete = { highlight = "GitSignsDelete" },
      },
      handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = true,
        handle = true,
        search = false, -- requires hlslens
      },
    },
  },

  -- ════════════════════════════════════════════════════════════
  -- 5. COLORIZER — Preview color inline
  -- ════════════════════════════════════════════════════════════
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      "css",
      "scss",
      "html",
      "javascript",
      "typescript",
      "typescriptreact",
      "javascriptreact",
      "lua",
      "vue",
      "svelte",
      "astro",
    },
  },

  -- ════════════════════════════════════════════════════════════
  -- 6. NOICE — Command line & notification override
  -- ════════════════════════════════════════════════════════════
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
        format = {
          cmdline = { pattern = "^:", icon = " ", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = "  ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = "  ", lang = "regex" },
          filter = { pattern = "^:%s*!", icon = " $", lang = "bash" },
          lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = " ", lang = "lua" },
        },
      },
      lsp = {
        progress = {
          enabled = true,
          view = "mini",
        },
        hover = { enabled = true },
        signature = { enabled = true },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = false,          -- search popup thay vì bottom
        command_palette = true,         -- command popup centered
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,          -- border cho LSP hover/signature
      },
      views = {
        cmdline_popup = {
          position = { row = "40%", col = "50%" },
          size = { width = 60, height = "auto" },
          border = { style = "rounded", padding = { 0, 1 } },
        },
        popupmenu = {
          relative = "editor",
          position = { row = "50%", col = "50%" },
          size = { width = 60, height = 10 },
          border = { style = "rounded", padding = { 0, 1 } },
        },
        mini = {
          win_options = { winblend = 0 },
        },
      },
    },
  },

  -- ════════════════════════════════════════════════════════════
  -- 7. WINDOW SEPARATORS — Colored active/inactive
  -- ════════════════════════════════════════════════════════════
  {
    "nvim-zh/colorful-winsep.nvim",
    event = "WinNew",
    config = function()
      require("colorful-winsep").setup({
        hi = {
          fg = "#7aa2f7",
          bg = "NONE",
        },
        symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
        smooth = true,
        exponential_smoothing = true,
      })
    end,
  },

  -- ════════════════════════════════════════════════════════════
  -- 8. TODO COMMENTS — Enhanced keywords + colors
  -- ════════════════════════════════════════════════════════════
  {
    "folke/todo-comments.nvim",
    opts = {
      signs = true,
      keywords = {
        FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = " ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      highlight = {
        multiline = true,
        before = "",
        keyword = "wide_bg",
        after = "fg",
        pattern = [[.*<(KEYWORDS)\s*:]],
      },
    },
  },

  -- ════════════════════════════════════════════════════════════
  -- 9. ILLUMINATE — Better symbol highlight
  -- ════════════════════════════════════════════════════════════
  {
    "RRethy/vim-illuminate",
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      under_cursor = true,
      providers = { "lsp", "treesitter", "regex" },
      filetypes_denylist = {
        "dirbuf",
        "dirvish",
        "fugitive",
        "dashboard",
        "TelescopePrompt",
        "neo-tree",
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      -- Underline style thay vì background cho clean look
      vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = true })
      vim.api.nvim_set_hl(0, "IlluminatedWordRead", { underline = true })
      vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { underline = true, bold = true })
    end,
  },

  -- ════════════════════════════════════════════════════════════
  -- 10. ICONS — Fix Rust icon for older Nerd Fonts
  -- ════════════════════════════════════════════════════════════
  {
    "echasnovski/mini.icons",
    opts = {
      extension = {
        rs = { glyph = "", hl = "MiniIconsOrange" },
      },
    },
  },
}
