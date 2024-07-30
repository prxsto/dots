local function map(mode, lhs, rhs, opts)
   -- set default value if not specify
   if opts.noremap == nil then
      opts.noremap = true
   end
   if opts.silent == nil then
      opts.silent = true
   end

   vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- writing to files
map("n", "<Leader>ww", "<cmd>write<CR>", { desc = "write current buffer" })
map("n", "<leader>wa", "<cmd>wall<cr>", { desc = "write all buffers" })

-- map leader+y to copy to system clipboard in normal and visual mode
map({ "n", "v" }, "<Leader>y", '"+y', { desc = "copy to clipboard" })

-- remove highlight
map("n", "<leader>nh", "<cmd>nohl<cr>", { desc = "remove highlights" })

-- window management
map("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" })     -- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" })   -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "make splits equal size" })      -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "close current split" }) -- close current split window

-- move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "go to right window" })

-- lazy
map("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "lazy" })

-- buffers
map("n", "<leader>bg", "<cmd>BufferLinePick<cr>", { desc = "go to buffer" })
map("n", "<leader>bq", "<cmd>bd<cr>", { desc = "quit current buffer" })
map("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "next buffer" })
map("n", "<S-tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "prev buffer" })
map("n", "<leader>bo", "<cmd>%bd|e#<cr>", { desc = "close all other buffers" })

-- oil
map("n", "-", "<CMD>Oil<CR>", { desc = "open parent directory" })

-- auto-save
-- map("n", "<leader>as", ":ASToggle<CR>", { desc = "toggle auto-save" })

-- precognition
map("n", "<leader>pt", function()
   require("precognition").toggle()
end, { desc = "toggle precognition" })
map("n", "<leader>pp", function()
   require("precognition").peek()
end, { desc = "precognition peek" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "quit all" })
