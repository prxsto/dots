vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.diagnostic.config({
	virtual_text = false,
	float = { border = "rounded", header = false, focusable = true },
})

-- Add the border on hover and on signature help popup window
local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		--FIX: vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
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
	"tsserver",
	"cssls",
	"tailwindcss",
	"jsonls",
	"eslint",
	"html",
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
			require("lspconfig").lua_ls.setup({
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
			})

			require("lspconfig").tailwindcss.setup({
				on_attach = function()
					require("tailwindcss-colors").buf_attach(0)
				end,
			})

			for _, language in pairs(languages) do
				require("lspconfig")[language].setup({
					capabilities = capabilities,
					handlers = handlers,
				})
			end

			vim.keymap.set(
				"n",
				"<Leader>fa",
				":EslintFixAll<CR>",
				{ desc = "fix all (ESlint)", noremap = true, silent = true }
			)

			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					virtual_text = false,
				})

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
