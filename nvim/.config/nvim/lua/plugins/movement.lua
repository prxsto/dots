return {
   {
      "otavioschwanck/arrow.nvim",
      opts = {
         show_icons = true,
         leader_key = ";",  -- Recommended to be a single key
         buffer_leader_key = "m", -- Per Buffer Mappings
      },
   },
   {
      "christoomey/vim-tmux-navigator",
      vim.keymap.set("n", "C-h", ":TmuxNavigateLeft<cr>"),
      vim.keymap.set("n", "C-j", ":TmuxNavigateDown<cr>"),
      vim.keymap.set("n", "C-k", ":TmuxNavigateUp<cr>"),
      vim.keymap.set("n", "C-l", ":TmuxNavigateRight<cr>"),
   },
}
