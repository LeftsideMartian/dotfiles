return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    skip_confirm_for_simple_edits = true,
    delete_to_trash = true,
    watch_for_changes = true,
    view_options = {
      show_hidden = true,
      case_insensitive = true,
      is_always_hidden = function(name, bufnr)
        return name == '..'
      end,
    }
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if you prefer nvim-web-devicons
  lazy = false,
}
