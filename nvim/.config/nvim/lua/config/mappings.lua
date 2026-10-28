-- ~/.config/nvim/lua/config/mappings.lua

--[[
C - Control/Ctrl
j - Shift
A - Alt (or option)
D - Super (windows key, command, etc.)

Esc - Esc
CR - Enter
Tab - Tab
BS - Backspace
etc...

E.g.
"<C-S-p>"  Ctrl + Shift + P
"<A-C-j>"  Alt + Ctrl + J
"<C-A-S-k>" Ctrl + Alt + Shift + K
]] --

local normalMode = 'n'
local visualMode = 'v'

local function map(mode, key, action, desc)
  vim.keymap.set(mode, key, action, {
    desc = desc,
    noremap = true, -- When executing action, do not resolve action to another keymap
    silent = true   -- Do not show the keymap in the command area at bottom of screen
  })
end

-- Config keymaps
map(normalMode, '<leader>cs', '<cmd>source %<CR>', 'Source current file')
map(normalMode, '<leader>ln', function() -- Toggle relative line numbers
  vim.wo.relativenumber = ! vim.wo.relativenumber
end)
map(normalMode, '<leader><S-p>', function() -- List hidden characters
  vim.o.list = ! vim.o.list
end)

-- =================================
-- Normal Mode
-- =================================

-- Insert newline outside of insert mode_
map(normalMode, '<leader>o', 'o<Esc>')
map(normalMode, '<leader>O', 'O<Esc>')

-- Write and quit shortcuts
map(normalMode, '<leader>w', '<cmd>w<CR>')
map(normalMode, '<leader>q', '<cmd>q<CR>')
map(normalMode, '<leader>Q', '<cmd>q!<CR>')

-- Cancel selection highlighting on Esc
map(normalMode, '<Esc>', '<cmd>nohl<CR>')

-- Paste without overriding clipboard
map(visualMode, 'p', '"_dp')

-- =================================
-- Buffers
-- =================================

-- Buffer navigation with Ctrl + hjkl
map(normalMode, '<C-h>', '<C-w>h')
map(normalMode, '<C-j>', '<C-w>j')
map(normalMode, '<C-k>', '<C-w>k')
map(normalMode, '<C-l>', '<C-w>l')

-- Move buffer with Ctrl + HJKL
map(normalMode, '<C-S-H>', '<C-w>H')
map(normalMode, '<C-S-J>', '<C-w>J')
map(normalMode, '<C-S-K>', '<C-w>K')
map(normalMode, '<C-S-L>', '<C-w>L')
      
-- =================================
-- Navigation
-- =================================

-- Centre page on up and down
map(normalMode, '<C-u>', '<C-u>zz')
map(normalMode, '<C-d>', '<C-d>zz')

-- Easier start/end line nav
map(normalMode, 'H', "_")
map(normalMode, 'L', "$")

-- Centre search terms
map(normalMode, 'n', 'nzz')
map(normalMode, 'N', 'Nzz')

-- Disable arrow keys (we don't need em 😎)
map(normalMode, '<left>', '<cmd>echo "Use h to move!!"<CR>')
map(normalMode, '<down>', '<cmd>echo "Use j to move!!"<CR>')
map(normalMode, '<up>', '<cmd>echo "Use k to move!!"<CR>')
map(normalMode, '<right>', '<cmd>echo "Use l to move!!"<CR>')

-- =================================
-- Visual mode
-- =================================

-- Indent in visual mode
map(visualMode, '>', '>gv')
map(visualMode, '<', '<gv')

-- Move selected lines up or down
map(visualMode, '<A-j>', ":m '>+1<CR>gv=gv")
map(visualMode, '<A-k>', ":m '<-2<CR>gv=gv")

-- Duplicate line
map(visualMode, '<A-S-j>', ":t '><CR>gv=gv")
map(visualMode, '<A-S-k>', ":t '<-1<CR>gv=gv")

-- Select all
map(normalMode, '<C-a>', 'ggVG')


-- =================================
-- Plugins
-- =================================

map(normalMode, '<leader>l', '<cmd>Lazy<CR>')

-- =========== Telescope ===========
local telescope = require('telescope.builtin')

local function find_project_files()
  local ignored_dirs = {
    '.git',
    '**/tmux/plugins/**',
    '**/zsh/plugins/**',
    '**/yazi/flavors/**',
    '**/node_modules/**',
  }

  local find_command = {
    'rg',
    '--files',
    '--hidden',
    '--follow',
    '--no-ignore',
  }

  for _, dir in ipairs(ignored_dirs) do
    table.insert(find_command, '--glob')
    table.insert(find_command, '!' .. dir)
  end

  local result = vim.fn.systemlist({
    'git',
    'rev-parse',
    '--show-toplevel',
  })

  local cwd

  if vim.v.shell_error == 0 and result[1] and result[1] ~= '' then
    -- Inside a Git repository: search from its root
    cwd = result[1]
  else
    -- Outside Git: use Neovim's current working directory
    cwd = vim.fn.getcwd()
  end

  telescope.find_files({
    cwd = cwd,
    find_command = find_command
  })
end

map(normalMode, '<leader>ff', telescope.find_files)
map(normalMode, '<leader>fp', find_project_files)
map(normalMode, '<leader>fk', telescope.keymaps)
map(normalMode, '<leader>f/', function()
  telescope.current_buffer_fuzzy_find({ previewer = false, prompt_title = 'Find Line' })
end)
