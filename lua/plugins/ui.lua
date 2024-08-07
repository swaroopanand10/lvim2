return {

	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<A-q>",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				mode = { "n", "i" },
				desc = "Dismiss all Notifications",
			},
		},
	},

	{
		"nvimdev/dashboard-nvim",
		-- event = 'VimEnter',
		config = function(_, opts) -- passing opts as a table
			local logo = [[]]
			logo = string.rep("\n", 2) .. logo .. "\n\n"
			opts.config.header = vim.split(logo, "\n")
			-- if type(opts.config.center) == "table" then
			-- 	vim.list_extend(opts.config.center, {
			-- 		{
			-- 			action = 'lua require("persisted").load()',
			-- 			desc = " Restore persisted Session",
			-- 			icon = " ",
			-- 			key = "d",
			-- 		},
			-- 	})
			-- end
			for _, button in ipairs(opts.config.center) do -- for removing square brackets from around key (copied from lazyvim repo)
				-- button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
				button.key_format = "  %s"
			end
			require("dashboard").setup(opts) -- without this undefined behavour without errors
		end,
	},

	{
		"uga-rosa/ccc.nvim",
		cmd = "CccPick",
		keys = {
			{
				"<leader>jC",
				"<cmd>CccPick<cr>",
				silent = true,
				desc = "Ccc Pick",
			},
			{
				"<leader>jc",
				"<cmd>CccHighlighterToggle<cr>",
				silent = true,
				desc = "Ccc highlight toggle",
			},
		},
		config = function()
			local ccc = require("ccc")

			-- Use uppercase for hex codes.
			-- ccc.output.hex.setup({ uppercase = true })
			-- ccc.output.hex_short.setup({ uppercase = true })

			ccc.setup({
				highlighter = {
					auto_enable = true,
					-- filetypes = colored_fts,
					lsp = true,
				},
			})
		end,
	},

	{
		"benlubas/wrapping-paper.nvim",
		keys = {
			{
				mode = { "n" },
				"gw",
				"<cmd>lua require('wrapping-paper').wrap_line()<cr>",
				silent = true,
				desc = "fake wrap current line",
			},
		},
	},

	{
		"folke/which-key.nvim",
		-- optional = true,
		opts = {
			-- triggers_blacklist = {
			-- 	i = { "j" },
			-- 	v = { "j", "k", "l" },
			-- 	n = { "k", "l", "j" },
			-- 	x = { "k", "l", "j" },
			-- 	o = { "k", "l", "j" },
			-- },

			spec = {
				{ "<leader>h", group = "harpoon" },
				{ "<leader>i", group = "neorg" },
				{ "<leader>j", group = "extra" },
				{ "<leader>j", group = "fzf-lua" },
				{ "<leader>jm", group = "multicursors" },
				{ "<leader>jn", group = "compitest" },
				{ "<leader>jw", group = "windowpick" },
				{ "<leader>jy", group = "Yank" },
				{
					"<leader>jyp",
					function()
						local path = vim.fn.expand("%:p")
						vim.fn.setreg("+", path)
						vim.notify('Copied "' .. path .. '" to the clipboard!')
					end,
					desc = "Copy Absolute Path",
				},
				{
					"<leader>jyr",
					function()
						local path = vim.fn.expand("%")
						vim.fn.setreg("+", path)
						vim.notify('Copied "' .. path .. '" to the clipboard!')
					end,
					desc = "Copy Relative Path",
				},
			},
		},
	},

	{
		"folke/zen-mode.nvim",
		keys = {
			{
				"<leader>jz",
				"<cmd>:ZenMode<cr>",
				silent = true,
				desc = "zenmode toggle",
			},
			{
				"<A-c>",
				"<cmd>:ZenMode<cr>",
				silent = true,
				desc = "zenmode toggle",
			},
		},
		opts = {
			-- window = {
			-- width = 0.60,
			-- },
			plugins = {
				-- disable some global vim options (vim.o...)
				-- comment the lines to not apply the options
				options = {
					enabled = true,
					ruler = false, -- disables the ruler text in the cmd line area
					showcmd = false, -- disables the command in the last line of the screen
					-- you may turn on/off statusline in zen mode by setting 'laststatus'
					-- statusline will be shown only if 'laststatus' == 3
					laststatus = 0, -- turn off the statusline in zen mode
					-- foldcolumn = "9", -- disable fold column
				},
				tmux = { enabled = true }, --seems that true value disables the tmux statusline
				kitty = {
					enabled = false, --disabling it since it is forcing the text size to fall back to default small, anyway didn't need it
					font = "+4", -- font size increment
				},
			},
			-- callback where you can add custom code when the Zen window opens
			on_open = function(win)
			     -- vim.cmd('set foldcolumn=9')
			     vim.cmd('set signcolumn=yes:9')
			end,
			-- -- callback where you can add custom code when the Zen window closes
			-- on_close = function() end,
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		event = function() -- this will cause lua line to not load at startup
			local new_events = {}
			return new_events
		end,
	},
}
