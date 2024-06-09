local opt = vim.opt -- for conciseness

opt.laststatus = 3 -- fix for lualine

-- enable line number and relative line number
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes" -- always show signcolumn for extra padding

-- line spacing
opt.linespace = 10

-- width of a tab
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

-- use number of spaces to insert a <Tab>
opt.expandtab = true

opt.wrap = false -- disable line wrap

opt.fillchars = { eob = " " } -- hide fillchars

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line, or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
