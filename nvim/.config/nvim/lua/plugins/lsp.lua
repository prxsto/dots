local languages = {
	"lua_ls",
	"tsserver",
	"cssls",
	"tailwindcss",
	"jsonls",
	"html",
	"emmet_language_server",
}

return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.black,
					-- require("none-ls.diagnostics.eslint_d"),
				},
			})
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
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			for _, language in pairs(languages) do
				require("lspconfig")[language].setup({
					capabilities = capabilities,
				})
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "show hover info" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "go to definition" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "go to references" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "rename symbol" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "show code actions" })
			vim.keymap.set(
				"n",
				"<Leader>fa",
				":EslintFixAll<CR>",
				{ desc = "fix all (ESlint)", noremap = true, silent = true }
			)
		end,
	},
}
