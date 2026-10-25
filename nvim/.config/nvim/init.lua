-- Set leader key; setting this in init to avoid conflicts with lazy.lua and mappings.lua
local leaderKey = ' '
vim.keymap.set('', '<Space>', '<Nop>') -- Leader does nothing
vim.g.mapleader = leaderKey
vim.g.maplocalleader = leaderKey

-- Initialise lazy.nvim
require("config.lazy")

-- Load config files
require("config.options")
require("config.mappings")
require("config.autocmd")
