return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			return {
				options = {
					-- component_separators = { left = " ", right = " " },
					-- section_separators = { left = " ", right = " " },
					theme = "catppuccin",
					globalstatus = true,
					disabled_filetypes = { statusline = { "dashboard", "alpha", "neotree" }, winbar = {} },
				},
				sections = {
					lualine_a = { { "mode", icon = "" } },
					lualine_b = { { "branch", icon = "" } },
					lualine_c = {
						{
							"diagnostics",
							symbols = {
								error = " ",
								warn = " ",
								info = " ",
								hint = "󰝶 ",
							},
						},
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
						{
							"filename",
							symbols = { modified = "  ", readonly = "", unnamed = "" },
						},
					},
					lualine_x = {
						{
							require("lazy.status").updates,
							cond = require("lazy.status").has_updates,
						},
						{ "diff" },
					},
					lualine_y = {
						{
							"progress",
						},
						{
							"location",
						},
					},
					lualine_z = {
						function()
							return " " .. os.date("%H:%M")
						end,
					},
				},

				extensions = { "aerial", "lazy", "toggleterm", "mason", "neo-tree", "trouble" },
			}
		end,
	},
	{
		"akinsho/bufferline.nvim",
		lazy = false,
		keys = {
			{ "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "toggle pin" },
			{ "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", desc = "delete non-pinned buffers" },
		},
		opts = {
			options = {
				-- mode = "tabs",
				-- indicator = { style = "underline" },
				-- color_icons = true,
				buffer_close_icon = "󰅖",
				separator_style = "slant",
				numbers = "none",
				-- themable = true,
				-- always_show_bufferline = true,
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
			})
		end,
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		theme = "catppuccin",
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
		"yamatsum/nvim-cursorline",
		opts = {
			cursorword = {
				enable = true,
				min_length = 3,
				hl = { underline = true },
			},
			cursorline = {
				enable = false,
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
