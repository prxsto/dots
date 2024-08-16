return {
   "nvim-neo-tree/neo-tree.nvim",
   branch = "v3.x",
   dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
   },
   cmd = { "Neotree" },
   keys = {
      { "<leader>ee", "<cmd>Neotree toggle<CR>", desc = "toggle file explorer", silent = true },
   },
   config = function()
      require("neo-tree").setup({
         close_if_last_window = true,
         default_component_configs = {
            diagnostics = {
               symbols = {
                  hint = "󰝶",
                  info = "",
                  warn = "",
                  error = "",
               },
               highlights = {
                  hint = "DiagnosticSignHint",
                  info = "DiagnosticSignInfo",
                  warn = "DiagnosticSignWarn",
                  error = "DiagnosticSignError",
               },
            },
         },
         filesystem = {
            filtered_items = {
               visible = false,
               show_hidden_count = true,
               hide_dotfiles = false,
               hide_gitignored = true,
               hide_by_name = {
                  ".DS_Store",
               },
               never_show = {},
            },
         },
         window = {
            width = 30,
            mappings = {
               ["<space>"] = "none",
            },
         },
      })
   end,
}
