return {
   {
      "j-hui/fidget.nvim",
      opts = {
         notification = {
            window = {
               winblend = 0,
            },
         },
      },
   },
   {
      "smiteshp/nvim-navic",
      config = function()
         require("nvim-navic").setup({
            lsp = {
               auto_attach = true,
            },
            separator = " 󰁔 ",
         })
      end,
   },
   {
      "linrongbin16/lsp-progress.nvim",
      config = function()
         require("lsp-progress").setup()
      end,
   },
   {
      "catgoose/nvim-colorizer.lua",
      event = "BufreadPre",
      opts = {},
   },
   {
      "roobert/tailwindcss-colorizer-cmp.nvim",
   },
   {
      "stevearc/dressing.nvim",
      event = "VeryLazy",
      opts = {
         input = {
            default_prompt = "➤ ",
            border = "rounded",
         },
         select = { backend = { "telescope", "builtin" } },
      },
   },
   {
      "aznhe21/actions-preview.nvim",
      config = function()
         vim.keymap.set({ "v", "n" }, "<Leader>ca", require("actions-preview").code_actions)
      end,
   }
}
