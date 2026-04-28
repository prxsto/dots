-- treesitter.lua
vim.filetype.add({
   pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

return {
   {
      "romus204/tree-sitter-manager.nvim",
      event = { "BufReadPre", "BufNewFile" },
      config = function()
         require("tree-sitter-manager").setup({
            ensure_installed = {
               "hyprlang",
               "c",
               "go",
               "json",
               "javascript",
               "typescript",
               "tsx",
               "yaml",
               "html",
               "css",
               "prisma",
               "markdown",
               "markdown_inline",
               "svelte",
               "graphql",
               "lua",
               "vim",
               "dockerfile",
               "gitignore",
               "query",
               "vimdoc",
               "python",
               "rust",
               "tmux",
            },
            auto_install = true,
            highlight = true,
            border = "rounded",
         })
      end,
   },
   {
      "windwp/nvim-ts-autotag",
      event = { "BufReadPre", "BufNewFile" },
      config = function()
         require("nvim-ts-autotag").setup({
            opts = {
               enable_close = true,
               enable_rename = true,
               enable_close_on_slash = false -- auto close on </
            },
         })
      end,
   }
}
