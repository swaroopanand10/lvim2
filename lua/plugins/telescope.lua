return { --Tip - check the default bindings before setting them unneccesarily
	"nvim-telescope/telescope.nvim",
	lazy = true,
	dependencies = {
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			-- This will not install any breaking changes.
			-- For major updates, this must be adjusted manually.
			version = "^1.0.0",
		},
		"debugloop/telescope-undo.nvim",
		"jonarrien/telescope-cmdline.nvim",
	},
	keys = {
		-- some telescope bindings
		{
			"<leader>.",
			"<cmd>Telescope current_buffer_fuzzy_find<cr>",
			desc = "curbuf fuzzy find",
		},
		{ -- will search for normal files in cwd
			"<leader>jf",
			"<cmd>lua require('telescope.builtin').find_files({hidden=false})<cr>",
			silent = true,
			desc = "find normal files in curdir",
		},
		{ -- will search for all including hidden files in cwd
			"<leader>ja",
			"<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>",
			silent = true,
			desc = "find all(+hid) files in curdir",
		},
		{ -- helps in live-grepping through rg with arguments
			"<leader>jr",
			":lua require('telescope').load_extension('live_grep_args')<cr> <bar> :Telescope live_grep_args<cr>",
			silent = true,
			desc = "telescope livegrep with args",
		},
		{
			"<leader>ju",
			"<cmd>Telescope undo<cr>",
			desc = "undo history",
		},
		{
			"<leader>jk",
			function()
				require("telescope.builtin").find_files({ cwd = require("telescope.utils").buffer_dir() })
			end,
			desc = "find files(normal) directory of current file",
		},
		{
			"<leader>jK",
			-- "<cmd>Telescope undo<cr>",
			function()
				require("telescope.builtin").find_files({ cwd = require("telescope.utils").buffer_dir(), hidden = true })
			end,
			desc = "find files(all) directory of current file",
		},
		-- {
		-- 	"<leader>jH",
		-- 	"<cmd>DevdocsOpenCurrent<cr>",
		-- 	desc = "devdocs opencurrent",
		-- },

		-- cmdline keybinds
		{ "<leader>jg", "<cmd>Telescope cmdline<cr>", desc = "Cmdline" },
	},
	opts = function(_, opts)
		local actions = require("telescope.actions")
		opts.defaults = vim.tbl_deep_extend(
			"force",
			opts.defaults or {},
			{ -- this will merge these mappings with already given mapping in lazyvim defaults, without overriding the whole thing
				mappings = {
					n = {
						["q"] = actions.close,
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
						["<C-f>"] = actions.preview_scrolling_left,
						["<C-b>"] = actions.preview_scrolling_right,
						["<M-j>"] = actions.results_scrolling_left,
						["<M-k>"] = actions.results_scrolling_right,
						["<A-d>"] = actions.delete_buffer,
						["<esc>"] = actions.close,
					},
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
						["<C-f>"] = actions.preview_scrolling_right,
						["<C-b>"] = actions.preview_scrolling_left,
						["<M-j>"] = actions.results_scrolling_left,
						["<M-k>"] = actions.results_scrolling_right,
						["<A-d>"] = actions.delete_buffer,
						["<esc>"] = actions.close,
						["<C-c>"] = actions.close,
					},
				},
			}
		)

		opts.extensions = vim.tbl_deep_extend("force", opts.extensions or {}, {
			-- persisted = {
			-- 	layout_config = { width = 0.55, height = 0.55 },
			-- },
			undo = {
				side_by_side = true,
				-- layout_strategy = "horizontal",
				-- layout_config = {
				--   preview_width = 0.5,
				-- },
				layout_strategy = "vertical",
				layout_config = {
					height = 0.98,
					width = 0.98,
					preview_cutoff = 10,
					preview_height = 0.55,
				},
			},
			cmdline = {
				picker = {
					layout_config = {
						width = 120,
						height = 25,
					},
				},
				mappings = {
					complete = "<Tab>",
					run_selection = "<C-CR>",
					run_input = "<CR>",
				},
			},
		})
	end,
}
