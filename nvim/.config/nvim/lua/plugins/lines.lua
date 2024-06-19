return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			return {
				options = {
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
				buffer_close_icon = "󰅖",
				separator_style = "slant",
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
	-- {
	-- 	"b0o/incline.nvim",
	-- 	-- event = "VeryLazy",
	-- 	config = function()
	-- 		require("incline").setup({
	-- 			debounce_threshold = {
	-- 				falling = 50,
	-- 				rising = 10,
	-- 			},
	-- 			hide = {
	-- 				cursorline = false,
	-- 				focused_win = false,
	-- 				only_win = false, -- Hide incline if only one window in tab
	-- 			},
	-- 			highlight = {
	-- 				groups = {
	-- 					InclineNormal = {
	-- 						default = true,
	-- 						group = "NormalFloat",
	-- 					},
	-- 					InclineNormalNC = {
	-- 						default = true,
	-- 						group = "NormalFloat",
	-- 					},
	-- 				},
	-- 			},
	-- 			ignore = {
	-- 				buftypes = "special",
	-- 				filetypes = {},
	-- 				floating_wins = true,
	-- 				unlisted_buffers = true,
	-- 				wintypes = "special",
	-- 			},
	-- 			render = function(props)
	-- 				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
	-- 				local devicons = require("nvim-web-devicons")
	-- 				local helpers = require("incline.helpers")
	-- 				local colors = require("catppuccin.palettes").get_palette("mocha")
	-- 				if filename == "" then
	-- 					filename = "[No Name]"
	-- 				end
	-- 				local ft_icon, ft_color = devicons.get_icon_color(filename)
	-- 				local modified = vim.bo[props.buf].modified
	-- 				return {
	-- 					ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) }
	-- 						or "",
	-- 					" ",
	-- 					{ filename, gui = modified and "bold,italic" or "bold" },
	-- 					" ",
	-- 					guibg = colors.surface0,
	-- 				}
	-- 			end,
	-- 			window = {
	-- 				margin = {
	-- 					horizontal = 1,
	-- 					vertical = 1,
	-- 				},
	-- 				options = {
	-- 					signcolumn = "no",
	-- 					wrap = false,
	-- 				},
	-- 				padding = 0,
	-- 				padding_char = " ",
	-- 				placement = {
	-- 					horizontal = "right",
	-- 					vertical = "top",
	-- 				},
	-- 				width = "fit",
	-- 				winhighlight = {
	-- 					active = {
	-- 						EndOfBuffer = "None",
	-- 						Normal = "InclineNormal",
	-- 						Search = "None",
	-- 					},
	-- 					inactive = {
	-- 						EndOfBuffer = "None",
	-- 						Normal = "InclineNormalNC",
	-- 						Search = "None",
	-- 					},
	-- 				},
	-- 				zindex = 50,
	-- 			},
	-- 		})
	-- 	end,
	-- },
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
