return {
  {
    "ibhagwan/fzf-lua",
    opts = function()
      -- Fix fzf-lua trouble action prefix for Windows
      -- The default trouble.nvim prefix uses nested parentheses which confuses fzf on Windows
      -- transform(IF %FZF_SELECT_COUNT% LEQ 0 (echo select-all))
      -- We replace it with:
      -- transform(IF %FZF_SELECT_COUNT% LEQ 0 echo select-all)
      
      local ok, trouble_fzf = pcall(require, "trouble.sources.fzf")
      if ok and trouble_fzf.actions then
        if trouble_fzf.actions.open and trouble_fzf.actions.open.prefix then
             if trouble_fzf.actions.open.prefix:find("transform%(IF") then
                trouble_fzf.actions.open.prefix = "select-all"
             end
        end
        if trouble_fzf.actions.add and trouble_fzf.actions.add.prefix then
             if trouble_fzf.actions.add.prefix:find("transform%(IF") then
                trouble_fzf.actions.add.prefix = "select-all"
             end
        end
      end
    end,
  },
}
