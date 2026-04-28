vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.diagnostic.config({
   virtual_text = false,
   float = { border = "rounded", header = false, focusable = true },
})

-- Add the border on hover and on signature help popup window
local handlers = {
   ["textDocument/hover"] = function(err, result, ctx, config)
      return vim.lsp.handlers.hover(err, result, ctx, vim.tbl_extend("force", config or {}, {
         border = "rounded",
      }))
   end,
   ["textDocument/signatureHelp"] = function(err, result, ctx, config)
      return vim.lsp.handlers.signature_help(err, result, ctx, vim.tbl_extend("force", config or {}, {
         border = "rounded",
      }))
   end,
}
vim.api.nvim_create_autocmd("LspAttach", {
   group = vim.api.nvim_create_augroup("UserLspConfig", {}),
   callback = function(ev)
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "show doc info" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "go to definition" })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "go to declaration" })
      --FIX: vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "go to implementation" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "find references" })
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "rename symbol" })
      vim.keymap.set(
         { "n", "v" },
         "<Leader>ca",
         vim.lsp.buf.code_action,
         { noremap = true, silent = true, desc = "show code actions" }
      )
   end,
})

local languages = {
   "lua_ls",
   "gopls",
   "ts_ls",
   "cssls",
   "tailwindcss",
   "jsonls",
   "eslint",
   "html",
   "pyright",
   "ruff",
   "emmet_language_server",
   -- "hyprls",
}

return {
   {
      "themaxmarchuk/tailwindcss-colors.nvim",
      module = "tailwindcss-colors",
      config = function()
         require("tailwindcss-colors").setup()
      end,
   },
   {
      "neovim/nvim-lspconfig",
      dependencies = { "hrsh7th/cmp-nvim-lsp" },
      config = function()
         local capabilities = require("cmp_nvim_lsp").default_capabilities()

         vim.lsp.config.lua_ls = {
            capabilities = capabilities,
            handlers = handlers,
            settings = {
               Lua = {
                  diagnostics = {
                     virtual_text = false,
                     float = {
                        source = "always",
                        header = false,
                        border = "rounded",
                        focusable = false,
                        prefix = "● ",
                        scope = "cursor",
                     },
                     globals = { "vim", "describe", "it" },
                  },
               },
            },
         }

         vim.lsp.config.tailwindcss = {
            on_attach = function(client, bufnr)
               require("tailwindcss-colors").buf_attach(bufnr)
            end,
         }

         vim.lsp.config.pyright = {
            settings = {
               python = {
                  analysis = {
                     extrapaths = {
                        "/home/prxsto/dev/gis-revit/venv/lib/python3.11/site-packages"
                     }
                  }
               }
            }
         }

         for _, language in pairs(languages) do
            vim.lsp.config[language] = {
               capabilities = capabilities,
               handlers = handlers,
            }
         end

         vim.keymap.set(
            "n",
            "<Leader>fa",
            ":EslintFixAll<CR>",
            { desc = "fix all (ESlint)", noremap = true, silent = true }
         )

         local symbols = { Error = "", Warn = "", Info = "", Hint = "󰝶" }
         for name, icon in pairs(symbols) do
            local hl = "DiagnosticSign" .. name
            vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
         end

         local hl_groups = {
            "DiagnosticUnderlineError",
            "DiagnosticUnderlineWarn",
            "DiagnosticUnderlineInfo",
            "DiagnosticUnderlineHint",
         }
         for _, hl in ipairs(hl_groups) do
            vim.cmd.highlight(hl .. " gui=undercurl")
         end
      end,
   },
   {
      "williamboman/mason.nvim",
      lazy = false,
      config = function()
         require("mason").setup()
         vim.keymap.set("n", "<leader>mm", "<cmd>Mason<CR>", { desc = "mason" })
      end,
   },
   {
      "williamboman/mason-lspconfig.nvim",
      auto_install = true,
      config = function()
         require("mason-lspconfig").setup({
            ensure_installed = languages,
         })
      end,
   },
}
