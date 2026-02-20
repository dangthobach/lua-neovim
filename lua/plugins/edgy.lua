-- Custom edgy.nvim overrides for window panel management
-- Base config comes from lazyvim.plugins.extras.ui.edgy
return {
  "folke/edgy.nvim",
  opts = function(_, opts)
    -- Extend bottom panels
    opts.bottom = opts.bottom or {}
    table.insert(opts.bottom, { ft = "dbout", title = "DB Result", size = { height = 0.3 } })

    -- Extend left panels
    opts.left = opts.left or {}
    table.insert(opts.left, { ft = "dbui", title = "Database", size = { width = 0.2 } })

    return opts
  end,
}
