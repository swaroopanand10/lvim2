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
		optional = true,
		opts = {
			triggers_blacklist = {
				i = { "j" },
				v = { "j", "k", "l" },
				n = { "k", "l", "j" },
				x = { "k", "l", "j" },
				o = { "k", "l", "j" },
			},

			defaults = {
				["<leader>k"] = { name = "+fzflua" },
				["<leader>j"] = { name = "+extra" },
				["<leader>jw"] = { name = "+windowpick" },
				["<leader>jn"] = { name = "+compitest" },
				["<leader>jm"] = { name = "+multicursors" },
				["<leader>h"] = { name = "+harpoon" },
				["<leader>i"] = { name = "+neorg" },
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
		},
		opts = {
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
				},
				tmux = { enabled = true }, --seems that true value disables the tmux statusline
				kitty = {
					enabled = false, --disabling it since it is forcing the text size to fall back to default small, anyway didn't need it
					font = "+4", -- font size increment
				},
			},
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		event = function()
			local new_events = {}
			return new_events
		end,
		config = function()
			local status_ok, lualine = pcall(require, "lualine")
			if not status_ok then
				return
			end

			local icons = require("lib.icons")

			local colors = {
				bg = "#202328",
				fg = "#bbc2cf",
				yellow = "#ECBE7B",
				cyan = "#008080",
				darkblue = "#081633",
				green = "#98be65",
				orange = "#FF8800",
				violet = "#a9a1e1",
				magenta = "#c678dd",
				blue = "#51afef",
				red = "#ec5f67",
			}

			local conditions = {
				buffer_not_empty = function()
					return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
				end,
				buffer_is_file = function()
					return vim.bo.buftype == ""
				end,
				hide_in_width = function()
					return vim.fn.winwidth(0) > 80
				end,
				check_git_workspace = function()
					local filepath = vim.fn.expand("%:p:h")
					local gitdir = vim.fn.finddir(".git", filepath .. ";")
					return gitdir and #gitdir > 0 and #gitdir < #filepath
				end,
			}
			local progress = { "progress", color = { fg = colors.fg, gui = "bold" } }
			local filetype = { "filetype", color = { fg = colors.blue, gui = "bold" } }
			local filesize =
				{ "filesize", color = { fg = colors.fg, gui = "bold" }, cond = conditions.buffer_not_empty }

			local filename = {
				"filename",
				cond = conditions.buffer_not_empty and conditions.buffer_is_file,
				color = { fg = colors.magenta, gui = "bold" },
			}

			local branch = {
				"branch",
				icon = icons.git.Branch,
				fmt = function(str)
					return str:sub(1, 32)
				end,
				color = { fg = colors.green, gui = "bold" },
			}

			local diff_icons = {
				"diff",
				symbols = { added = icons.git.AddAlt, modified = icons.git.DiffAlt, removed = icons.git.RemoveAlt },
				diff_color = {
					added = { fg = colors.green },
					modified = { fg = colors.orange },
					removed = { fg = colors.red },
				},
				cond = conditions.hide_in_width,
			}

			local diagnostics = {
				"diagnostics",
				sources = { "nvim_lsp", "nvim_diagnostic", "nvim_workspace_diagnostic" },
				symbols = {
					error = icons.diagnostics.Error,
					warn = icons.diagnostics.Warn,
					info = icons.diagnostics.Info,
					hint = icons.diagnostics.Hint,
				},
				diagnostics_color = {
					color_error = { fg = colors.red },
					color_warn = { fg = colors.yellow },
					color_info = { fg = colors.blue },
					color_hint = { fg = colors.yellow },
				},
			}

			local lsp = {
				function()
					local msg = "No LSP"
					local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
					local clients = vim.lsp.get_active_clients()
					if next(clients) == nil then
						return msg
					end
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							return client.name
						end
					end
					return msg
				end,
				icon = icons.ui.Gear,
				color = { fg = colors.fg, gui = "bold" },
			}

			local macro_recorder = {
				function()
					local reg = vim.fn.reg_recording()
					if reg == "" then
						return ""
					end -- not recording
					return "recording to " .. reg
				end,
				color = { fg = colors.fg, gui = "bold" },
			}

			local config = {
				options = {
					component_separators = "",
					-- section_separators = '',
					-- theme = 'rose-pine',
					-- theme = 'onedark',
					-- theme = 'tokyonight',
					disabled_filetypes = {
						"dashboard",
					},
				},
				extensions = { "quickfix", "man", "mason", "lazy", "toggleterm", "nvim-tree" },
				sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { filename, diff_icons, branch },
					lualine_x = { macro_recorder, diagnostics, lsp, filetype, "location", progress, filesize },
					lualine_y = {},
					lualine_z = {},
				},
			}

			lualine.setup(config)
		end,
	},

}
