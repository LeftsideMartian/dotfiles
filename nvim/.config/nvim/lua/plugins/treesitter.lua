return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local treesitter = require('nvim-treesitter')

    local parsers = {
      'bash',
      'lua',
    }

    -- Install parsers
    for _, parser in ipairs(parsers) do
      treesitter.install(parser)
    end

    -- Create a list of file patterns for all active parsers
    local patterns = {}
    for _, parser in ipairs(parsers) do
      local parser_patterns = vim.treesitter.language.get_filetypes(parser)
      for _, pp in pairs(parser_patterns) do
        table.insert(patterns, pp)
      end
    end

    -- Activate treesitter for relevant filetypes
    vim.api.nvim_create_autocmd('FileType', {
      pattern = patterns,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end
}
