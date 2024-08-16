return {
   {
      "kylechui/nvim-surround",
      version = "*",
      event = "VeryLazy",
      config = function()
         require("nvim-surround").setup({})
      end,
   },
   {
      "shortcuts/no-neck-pain.nvim",
      version = "*",
      keys = {
         { "<Leader>nn", ":NoNeckPain<CR>" },
      },
   },
   {
      "MaximilianLloyd/tw-values.nvim",
      keys = {
         {
            "gK",
            "<cmd>TWValues<cr>",
            desc = "Show tailwind CSS values",
         },
      },
      opts = {
         border = "rounded",
         show_unknown_classes = true,
         focus_preview = true,
      },
   },
   {
      "windwp/nvim-autopairs",
      event = { "InsertEnter" },
      dependencies = {
         "hrsh7th/nvim-cmp",
      },
      config = function()
         -- import nvim-autopairs
         local autopairs = require("nvim-autopairs")

         -- configure autopairs
         autopairs.setup({
            check_ts = true, -- enable treesitter
            ts_config = {
               -- don't add pairs in lua string treesitter nodes
               lua = { "string" },
               -- don't add pairs in javscript template_string treesitter nodes
               javascript = { "template_string" },
               java = false, -- don't check treesitter on java
            },
         })

         -- import nvim-autopairs completion functionality
         local cmp_autopairs = require("nvim-autopairs.completion.cmp")

         -- import nvim-cmp plugin (completions plugin)
         local cmp = require("cmp")

         -- make autopairs and completion work together
         cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end,
   },
   {
      "kawre/leetcode.nvim",
      build = ":TSUpdate html",
      dependencies = {
         "nvim-telescope/telescope.nvim",
         "nvim-lua/plenary.nvim", -- required by telescope
         "MunifTanjim/nui.nvim",

         -- optional
         "nvim-treesitter/nvim-treesitter",
         "rcarriga/nvim-notify",
         "nvim-tree/nvim-web-devicons",
      },
      opts = {
         -- configuration goes here
         {
            ---@type string
            arg = "leetcode.nvim",

            ---@type lc.lang
            lang = "golang",

            keys = {
               toggle = { "q" }, ---@type string|string[]
               confirm = { "<CR>" }, ---@type string|string[]

               reset_testcases = "r", ---@type string
               use_testcase = "U", ---@type string
               focus_testcases = "H", ---@type string
               focus_result = "L", ---@type string
            },
         }
      },
   }
}
