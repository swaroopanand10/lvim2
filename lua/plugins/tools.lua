return {
	{
		"folke/flash.nvim",
		event = function()
			local new_events = {}
			return new_events
		end,
		keys = {
			{
				"kl",
				mode = { "n", "x" }, -- no 'o' because is not needed
				function()
					require("flash").jump({
						search = { mode = "search", max_length = 0 },
						label = { after = { 0, 0 } },
						pattern = "^",
					})
				end,
				desc = "Label beginning of line",
			},
			{
				"lk",
				mode = { "n", "x" },
				function()
					require("flash").jump({
						search = { mode = "search", max_length = 0 },
						label = { after = { 0, 0 } },
						pattern = "^",
					})
				end,
				desc = "Label beginning of line",
			},
		},
		opts = {
			-- labels = "asdfghjklqwertyuiopzxcvbnm", --default
			labels = "asdfghjkl;uionwertmpqyzxcvb", --customized
			modes = {
				char = {
					--   jump_labels = true,
					keys = { "f", "F", "t", "T" },
				},
				search = {
					-- enabled = false,
				},
			},
		},
	},

	{
		"s1n7ax/nvim-window-picker",
		opts = {
			hint = "floating-big-letter",
			show_prompt = false,
		},
		keys = {
			{
				"<leader>jww",
				function()
					local winid = require("window-picker").pick_window()
					if winid then
						vim.api.nvim_set_current_win(winid)
					end
				end,
				desc = "switch window",
				silent = true,
			},
			{
				"<A-;>",
				function()
					local winid = require("window-picker").pick_window()
					if winid then
						vim.api.nvim_set_current_win(winid)
					end
				end,
				desc = "switch window",
				silent = true,
			},
			{
				"<leader>jwd",
				function()
					local winid = require("window-picker").pick_window()
					if winid then
						vim.api.nvim_win_close(winid, true)
					end
				end,
				desc = "delete window",
				silent = true,
			},
			{
				"<leader>jws",
				function()
					local windowid = require("window-picker").pick_window()
					local function swap_with(stay, winid)
						if not winid then
							return
						end

						local cur_winid = vim.fn.win_getid()

						local cur_bufnr = vim.api.nvim_win_get_buf(cur_winid)
						local target_bufnr = vim.api.nvim_win_get_buf(winid)

						vim.api.nvim_win_set_buf(cur_winid, target_bufnr)
						vim.api.nvim_win_set_buf(winid, cur_bufnr)

						if not stay then
							vim.api.nvim_set_current_win(winid)
						end
					end
					swap_with(true, windowid)
				end,
				desc = "swap window",
				silent = true,
			},
		},
	},

	{
		"mikesmithgh/kitty-scrollback.nvim",
		enabled = true,
		lazy = true,
		cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
		event = { "User KittyScrollbackLaunch" },
		-- version = '*', -- latest stable version, may have breaking changes if major version changed
		-- version = '^2.0.0', -- pin major version, include fixes and features that do not have breaking changes
		config = function()
			require("kitty-scrollback").setup()
		end,
	},

	{
		"echasnovski/mini.surround",
		opts = {
			mappings = {
				add = ",a",
				delete = ",d",
				find = ",f",
				find_left = ",F",
				highlight = ",h",
				replace = ",r",
				update_n_lines = ",n",
			},
		},
		keys = { ",a", ",r", ",d", ",h", ",n", ",f", ",F" },
	},

	{
		"2kabhishek/nerdy.nvim",
		dependencies = { "stevearc/dressing.nvim" },
		cmd = "Nerdy",
		keys = {
			{
				"<leader>j.",
				"<cmd>Nerdy<cr>",
				silent = true,
				desc = "Nerd font icons",
			},
		},
	},

	{
		"otavioschwanck/arrow.nvim",
		keys = { ";" },
		opts = {
			show_icons = true,
			leader_key = ";", -- Recommended to be a single key
		},
		config = function()
			require("arrow").setup({
				show_icons = true,
				always_show_path = false,
				separate_by_branch = false, -- Bookmarks will be separated by git branch
				hide_handbook = true, -- set to true to hide the shortcuts on menu.
				save_path = function()
					return vim.fn.stdpath("cache") .. "/arrow"
				end,
				mappings = {
					edit = "e",
					delete_mode = "D",
					clear_all_items = "C",
					toggle = "w", -- used as save if separate_save_and_remove is true
					open_vertical = "v",
					open_horizontal = "-",
					quit = "q",
					remove = "m", -- only used if separate_save_and_remove is true
				},
				-- custom_actions = {
				--     open = function(target_file_name, current_file_name) end, -- target_file_name = file selected to be open, current_file_name = filename from where this was called
				--     split_vertical = function(target_file_name, current_file_name) end,
				--     split_horizontal = function(target_file_name, current_file_name) end,
				-- },
				window = { -- controls the appearance and position of an arrow window (see nvim_open_win() for all options)
					width = "auto",
					height = "auto",
					row = "auto",
					col = "auto",
					border = "double",
				},
				separate_save_and_remove = true, -- if true, will remove the toggle and create the save/remove keymaps.
				leader_key = ";",
				global_bookmarks = false, -- if true, arrow will save files globally (ignores separate_by_branch)
				-- index_keys = '123456789zxcbnmZXVBNM,afghjklAFGHJKLwrtyuiopWRTYUIOP', -- keys mapped to bookmark index, i.e. 1st bookmark will be accessible by 1, and 12th - by c
				index_keys = "asdfgjhklrzxcni123456789uo", -- keys mapped to bookmark index, i.e. 1st bookmark will be accessible by 1, and 12th - by c
				full_path_list = { "update_stuff" }, -- filenames on this list will ALWAYS show the file path too.
			})
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		config = function()
			-- deleting these keybinds(setted be lazyvim) for terminal mode as these are used in actual terminal
			vim.keymap.del("t", "<C-j>")
			vim.keymap.del("t", "<C-k>")
			vim.keymap.del("t", "<C-l>")
			vim.keymap.del("t", "<C-h>")

			_G.set_terminal_keymaps = function()
				local opts = { noremap = true }
				vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<C-g>", [[<C-\><C-n>]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<m-h>", [[<C-\><C-n><C-W>h]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<m-j>", [[<C-\><C-n><C-W>j]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<m-k>", [[<C-\><C-n><C-W>k]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<m-l>", [[<C-\><C-n><C-W>l]], opts)
			end

			local opts = {
				size = 15,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				-- direction = "float",
				direction = "horizontal",
				close_on_exit = true,
				shell = vim.o.shell,

				vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()"),
			}
			require("toggleterm").setup(opts)
		end,
		cmd = "ToggleTerm",
		keys = { { "<c-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal" } },
	},
}
