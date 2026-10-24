-- ==================================
-- Global options
-- ==================================

vim.g.have_nerd_font = true

-- ==================================
-- Options
-- ==================================
local tabLength = 2

local options = {
  -- Indentation
  autoindent = true,
  smartindent = true,

  -- Line numbers
  number = true, -- Line numbers on
  relativenumber = true, -- Relative line numbers

  expandtab = true, -- Expand tabs to ' ' characters
  tabstop = tabLength,
  softtabstop = tabLength,
  shiftwidth = tabLength,

  -- Enable mouse
  mouse = 'a',

  breakindent = true,
  undofile = true, -- Keep track of undo/redo operations between file open and close

  -- Searchs with / and other commands are case insensitive unless you provide \C or there are capital letters in the search term
  ignorecase = true,
  smartcase = true,
  hlsearch = true,
  incsearch = true,

  -- The signcolumn is the gap between the left screen border and the line numbers. Always draw it
  signcolumn = 'yes',

  -- Update time determines how often the swap file is written to.
  -- The swap file is a file that stores changes made to a file before the file is written to
  updatetime = 250,

  -- Timeout length determines how long the user has to input keymaps before the keymap is considered finished
  timeoutlen = 1000,

  -- Splitting
  splitright = true,
  splitbelow = true,

  -- The list option displays hidden characters such as tabs and trailing spaces
  -- TODO: Set a list toggle on a keymap
  list = false, -- Disabled explicitly by default
  listchars = { tab = '» ', trail = '·', nbsp = '␣' }, -- Customize what chars to use for above list option

  -- Highlight the line with the cursor on it
  cursorline = true,

  -- Controls at how many lines to start scolling the page
  scrolloff = 10,

  -- If quitting without saving (with changes) (or on other destructive operations), raise a confirm popup
  confirm = true,

  -- Read file changes from outside the editor
  autoread = true,

  hidden = true,

  -- Use system clipboard
  clipboard = 'unnamedplus',

  -- Faster scrolling
  ttyfast = true,
  smoothscroll = true,

  title = true,
}

-- Load all above options
for k, v in pairs(options) do
  vim.opt[k] = v
end
