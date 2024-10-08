return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			return {
				options = {
					theme = "auto",
					lazy = false, -- removes flickering
					section_separators = { left = "", right = "" },
					globalstatus = true,
					disabled_filetypes = { statusline = { "dashboard", "neotree" }, winbar = {} },
				},
				sections = {
					lualine_a = { { "mode", icon = "" } },
					lualine_b = {
						{ "branch", icon = "", separator = { right = "" } },
						{
							"filetype",
							icon_only = true,
							color = { bg = "" },
							separator = "",
							padding = { left = 1, right = 0 },
						},
						{
							"filename",
							symbols = { modified = " 󱇧 ", readonly = "", unnamed = "" },
							color = { bg = "" },
							separator = "",
						},
					},
					lualine_c = {
						{ "%=", separator = "" },
						{
							"diagnostics",
							symbols = {
								error = " ",
								warn = " ",
								info = " ",
								hint = "󰝶 ",
							},
						},
					},
					lualine_x = {
						{
							require("lazy.status").updates,
							cond = require("lazy.status").has_updates,
							separator = "",
						},
						{ "diff", separator = "" },
					},
					lualine_y = {
						"location",
						{
							function()
								local words = vim.fn.wordcount()["words"]
								return "Words: " .. words
							end,
							cond = function()
								local ft = vim.opt_local.filetype:get()
								local count = {
									latex = true,
									tex = true,
									text = true,
									markdown = true,
									vimwiki = true,
								}
								return count[ft] ~= nil
							end,
						},
					},
					lualine_z = {
						function()
							return " " .. os.date("%H:%M")
							-- -- listen lsp-progress event and refresh lualine

							-- vim.api.nvim_create_autocmd("User", {
							-- 	group = "lualine_augroup",
							-- 	pattern = "LspProgressStatusUpdated",
							-- 	callback = require("lualine").refresh,
							-- })
							--
							-- return require("lsp-progress").progress()
						end,
					},
				},

				extensions = { "aerial", "lazy", "mason", "neo-tree", "trouble", "oil" },
			}
		end,
	},
	{
		"akinsho/bufferline.nvim",
		lazy = false,
		keys = {
			{
				"<leader>bp",
				"<cmd>BufferLineTogglePin<CR>",
				desc = "toggle pin",
			},
			{
				"<leader>bP",
				"<cmd>BufferLineGroupClose ungrouped<CR>",
				desc = "delete non-pinned buffers",
			},
		},
		opts = {
			options = {
				buffer_close_icon = "󰅖",
				numbers = "none",
				always_show_bufferline = true,
				diagnostics = "nvim-lsp",
				offsets = {
					{
						filetype = "neo-tree",
						text = " FILE EXPLORER",
						highlight = "Directory",
						text_align = "left",
						separator = false,
					},
				},
			},
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup({
				exclude = { filetypes = { "dashboard" } },
				indent = { char = "│" },
				-- highlight = "#6e6a86"
			})
		end,
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		theme = "auto",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			show_dirname = false,
			show_basename = false,
		},
	},
	{
		"b0o/incline.nvim",
		config = function()
			require("incline").setup()
		end,
		event = "VeryLazy",
	},
	{
		"yamatsum/nvim-cursorline",
		opts = {
			cursorword = {
				enable = true,
				min_length = 3,
				hl = { underline = true },
			},
			cursorline = {
				enable = true,
				timeout = 0,
			},
		},
	},
	{
		"lukas-reineke/virt-column.nvim",
		opts = {},
	},
	{
		"m4xshen/smartcolumn.nvim",
		opts = {
			disabled_filetypes = {
				"netrw",
				"NvimTree",
				"Lazy",
				"mason",
				"help",
				"text",
				"markdown",
				"tex",
				"html",
				"dashboard",
			},
			scope = "window",
		},
	},
}
