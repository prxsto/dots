local opt = vim.opt -- for conciseness

opt.laststatus = 3  -- fix for lualine

-- enable line number and relative line number
opt.number = true
opt.relativenumber = true

-- width of a tab
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

-- use number of spaces to insert a <Tab>
opt.expandtab = true

opt.wrap = false              -- disable line wrap

opt.fillchars = { eob = " " } -- hide fillchars

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true
opt.cursorlineopt = "number"

opt.termguicolors = true

opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
opt.splitkeep = "screen"

opt.swapfile = false

opt.updatetime = 250
opt.timeoutlen = 300

opt.conceallevel = 2 -- fixes obidian markdown display
