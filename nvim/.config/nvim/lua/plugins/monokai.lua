local fix_directory_style = function()
  vim.api.nvim_command('highlight! link Directory Normal')
end

return {
  'loctvl842/monokai-pro.nvim',
  version = 'v2.1.3', -- Pinning to this version as 2.1.4 has a bug on the filter config option (https://github.com/loctvl842/monokai-pro.nvim/issues/177)
  lazy = false,
  priority = 1000,
  config = function()
    require('monokai-pro').setup({
      -- transparent_background = true,
      terminal_colors = true,
      devicons = true,
      filter = 'classic',
    })
    vim.cmd.colorscheme('monokai-pro')

    -- Fix directory styling
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = 'monokai-pro',
      callback = fix_directory_style,
    })

    -- Apply now too
    fix_directory_style()
  end,
}
