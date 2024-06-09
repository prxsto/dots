return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
			local keymap = vim.keymap -- for conciseness
			keymap.set("n", "<leader>mm", "<cmd>Mason<CR>", { desc = "mason" })
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		auto_install = true,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"cssls",
					"tailwindcss",
					"jsonls",
					"html",
					"emmet_language_server",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.tsserver.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.tailwindcss.setup({ capabilities = capabilities })
			lspconfig.jsonls.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.emmet_language_server.setup({ capabilities = capabilities })
			---@diagnostic disable-next-line: trailing-space

			local keymap = vim.keymap -- for conciseness
			keymap.set("n", "K", vim.lsp.buf.hover, { desc = "show hover info" })
			keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "go to definition" })
			keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "go to references" })
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "rename symbol" })
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "show code actions" })
		end,
	},
}
