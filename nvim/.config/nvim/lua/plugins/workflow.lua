return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("obsidian").setup({
				workspaces = {
					{
						name = "main",
						path = "~/obsidian/main",
					},
				},
				completion = {
					nvim_cmp = true,
					min_chars = 2, -- trigger comp at 2 chars
				},
				wiki_link_func = "prepend_note_id",
				note_frontmatter_func = function(note)
					-- equivalent to default frontmatter function
					local out = { id = note.id, aliases = note.aliases, tags = note.tags }

					if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
						for k, v in pairs(note.metadata) do
							out[k] = v
						end
					end
					return out
				end,

				templates = {
					subdir = "_templates",
					date_format = "%Y-%m-%d",
					time_format = "%H:%M",
					tags = "",
					substutions = {
						yesterday = function()
							return os.date("%Y-%m-%d", os.time() - 86400)
						end,
						tomorrow = function()
							return os.date("%Y-%m-%d", os.time() - 86400)
						end,
					},
				},
				ui = {
					enable = false,
				},
			})
		end,
	},
	{
		"chrishrb/gx.nvim",
		keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
		cmd = { "Browse" },
		init = function()
			vim.g.netrw_nogx = 1 -- disable netrw gx
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true, -- default settings
		submodules = false,
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				default_file_explorer = true,
			})
		end,
	},
	{
		"rmagatti/auto-session",
		config = function()
			local auto_session = require("auto-session")

			auto_session.setup({
				auto_restore_enabled = false,
				auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
				session_lens = { -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
					buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
					load_on_setup = true,
					theme_conf = { border = true },
					previewer = false,
				},
			})

			local keymap = vim.keymap

			keymap.set("n", "<leader>fs", require("auto-session.session-lens").search_session, {
				desc = "find session",
				noremap = true,
			})
			keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "restore worksession for cwd" }) -- restore last workspace session for current directory
			keymap.set(
				"n",
				"<leader>ws",
				"<cmd>SessionSave<CR>",
				{ desc = "save worksession for auto session root dir" }
			) -- save workspace session for current working directory
		end,
	},
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"OXY2DEV/helpview.nvim",
		lazy = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		config = function()
			require("render-markdown").setup({
				bullet = {
					icons = { "", "", "", "" },
				},
			})
		end,
	},
}
