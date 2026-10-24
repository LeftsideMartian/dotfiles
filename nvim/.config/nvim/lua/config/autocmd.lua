-- ~/.config/nvim/lua/config/autocmd.lua

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = 'Highlight text on yank',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end
})

-- Disable automatic comment on newline
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})
