return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      -- ── ASCII Art ────────────────────────────────────────────
      local logo = [[
                                                                   
        ████ ██████           █████      ██                    
       ███████████             █████                            
       █████████ ███████████████████ ███   ███████████  
      █████████  ███    █████████████ █████ ██████████████  
     █████████ ██████████ █████████ █████ █████ ████ █████  
   ███████████ ███    ███ █████████ █████ █████ ████ █████ 
  ██████  █████████████████████ ████ █████ █████ ████ ██████
      ]]

      logo = string.rep("\n", 4) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          statusline = true,
          tabline = true,
          winbar = true,
        },
        config = {
          header = vim.split(logo, "\n"),
          center = {
            { action = "Telescope find_files", desc = " Find File", icon = " ", key = "f" },
            { action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
            { action = "Telescope oldfiles", desc = " Recent Files", icon = " ", key = "r" },
            { action = "Telescope live_grep", desc = " Find Text", icon = " ", key = "g" },
            { action = [[lua require("persistence").load()]], desc = " Restore Session", icon = " ", key = "s" },
            { action = "LazyExtras", desc = " Lazy Extras", icon = " ", key = "x" },
            { action = "Lazy", desc = " Lazy Plugins", icon = " ", key = "l" },
            { action = "qa", desc = " Quit", icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return {
              "",
              "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
              "",
              "💡 " .. os.date("%A, %B %d %Y — %H:%M"),
            }
          end,
        },
      }

      -- Thêm padding cho mỗi item
      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      return opts
    end,
  },
}
