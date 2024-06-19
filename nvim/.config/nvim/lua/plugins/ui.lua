return {
	{
		"m4xshen/catppuccinight.nvim",
		name = "catppuccin",
		opts = {
			flavour = "mocha",
			custom_highlights = function(colors)
				return {
					VertSplit = { fg = colors.surface0 },
					WinSeparator = { fg = colors.surface0 },
					FloatBorder = { fg = colors.surface2 },
				}
			end,
		},
		init = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
		end,
		opts = {
			defaults = {
				mode = { "n", "v" },
				["<leader>b"] = { name = "+buffer" },
				["<leader>c"] = { name = "+code" }, -- Completions
				["<leader>e"] = { name = "+explorer" }, -- Neotree
				["<leader>f"] = { name = "+find" }, -- Telescope
				["<leader>h"] = { name = "+harpoon" }, -- Harpoon
				["<leader>x"] = { name = "+diagnostics" }, -- Trouble
				["<leader>q"] = { name = "+quitting" }, -- Quitting
				["<leader>w"] = { name = "+worksessions/write" }, -- Autosession
				["<leader>s"] = { name = "+split" }, -- Splits
				["<leader>m"] = { name = "+mason" }, -- Mason
				["<leader>l"] = { name = "+lazy" }, -- Lazy
				["<leader>n"] = { desc = "which_key_ignore" },
				["<leader>d"] = { name = "+dashboard" }, -- Dashboard
				["<leader>g"] = { name = "+goto" }, -- Go to
				["<leader>r"] = { name = "+rename" }, -- Rename
				["<leader>p"] = { name = "+precog" }, --Precognition
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register(opts.defaults)
		end,
	},
	{
		"stevearc/aerial.nvim",
		opts = {},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local aerial = require("aerial")

			aerial.setup({
				attach_mode = "global",
				backends = { "lsp", "treesitter", "markdown", "man" },
				layout = { min_width = 28 },
				show_guides = true,
				filter_kind = false,
				guides = {
					mid_item = "├ ",
					last_item = "└ ",
					nested_top = "│ ",
					whitespace = "  ",
				},
				on_attach = function(bufnr)
					-- Jump forwards/backwards with '{' and '}'
					vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				end,
			})

			vim.keymap.set("n", "<leader>aa", "<cmd>AerialToggle!<CR>", { desc = "toggle outline" })
		end,
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
				config = {
					week_header = {
						enable = true,
					},
					shortcut = {
						{
							desc = "󰊳  update",
							icon_hl = "@variable",
							group = "@property",
							action = "Lazy update",
							key = "u",
						},
						{
							icon = "  ",
							icon_hl = "@variable",
							desc = "files",
							group = "Label",
							action = "Telescope find_files",
							key = "f",
						},
						{
							desc = "  dotfiles",
							group = "Number",
							action = "Telescope dotfiles",
							key = "d",
						},
					},
					footer = {},
				},
				vim.keymap.set(
					"n",
					"<leader>dd",
					"<cmd>Dashboard<CR> <BAR> <cmd>Neotree toggle<CR>",
					{ desc = "dashboard" }
				),
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
