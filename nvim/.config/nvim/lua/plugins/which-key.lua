---@type wk.Opts
local opts = {
  preset = "classic",
  delay = 500,
  spec = {
    {
      { '<leader>c', group = 'code' },
      { '<leader>f', group = 'find' },
    }
  }
}

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = opts,
}
