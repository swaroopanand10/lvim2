return {
	-- this is a correct way of configuring mason, so that the previous dafault items setup by lazyvim does not get overidden(same way also configure typescript (see lazyvim docs))
	{

		"williamboman/mason.nvim",
		optional = true,
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				-- vim.list_extend(opts.ensure_installed, { "stylua" })
				-- vim.list_extend(opts.ensure_installed, { "shfmt" })
				-- vim.list_extend(opts.ensure_installed, { "flake8" })
				vim.list_extend(opts.ensure_installed, { "html-lsp" })
				vim.list_extend(opts.ensure_installed, { "css-lsp" })
				vim.list_extend(opts.ensure_installed, { "emmet-ls" })
				vim.list_extend(opts.ensure_installed, { "bash-language-server" })
				vim.list_extend(opts.ensure_installed, { "debugpy" }) --adding this as well because it was not present in default lazyvim config
				vim.list_extend(opts.ensure_installed, { "zls" }) --adding this as well because it was not present in default lazyvim config
			end
		end,
	},

	{
		"kosayoda/nvim-lightbulb",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		opts = {
			autocmd = { enabled = true },
		},
	},
	{ -- not needed because of nvim-native-snippets
		"L3MON4D3/LuaSnip",
		dependencies = {},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load({
				paths = vim.fn.stdpath("config") .. "/snippets",
			})
		end,
	},

	-- currently punctuations not working
	-- {
	-- 	"garymjr/nvim-snippets",
	-- 	opts = {
	-- 		search_paths = { vim.fn.stdpath("config") .. "/snippets" },
	-- 	},
	-- },

	-- {
	-- 	"chrisgrieser/nvim-scissors",
	-- 	cmd = { "ScissorsAddNewSnippet", "ScissorsEditSnippet" },
	-- 	dependencies = { "nvim-telescope/telescope.nvim", "garymjr/nvim-snippets" },
	-- 	opts = {
	-- 		snippetDir = "$HOME/.config/nvim/snippets/",
	-- 	},
	-- },

	-- { -- not working
	-- 	"Apeiros-46B/qalc.nvim",
	-- 	cmd = "Qalc",
	-- 	config = function()
	-- 		require("qalc").setup({
	-- 			-- cmd_args = { "--set", "fr 5", "--set", "appr 3" }, -- this is working
	-- 		})
	-- 	end,
	-- },

	{
		"sindrets/diffview.nvim",
		cmd = "DiffviewOpen",
		keys = {
			{
				"<leader>js",
				":DiffviewOpen<cr>",
				silent = true,
				desc = "diff view git preview",
			},
		},
	},

	{
		"nvim-pack/nvim-spectre",
		opts = {
			mapping = {
				["toggle_ignore_case"] = {
					map = "I",
					cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
					desc = "toggle ignore case",
				},
				["toggle_ignore_hidden"] = {
					map = "H",
					cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
					desc = "toggle search hidden",
				},
			},
		},
		keys = {
			{
				"<leader>jS",
				'<cmd>lua require("spectre").open_file_search({select_word=false})<CR>',
				silent = true,
				desc = "Spectre on current file",
			},
		},
	},
	{
		"rmagatti/goto-preview",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		opts = {
			default_mappings = true,

			post_open_hook = function(bufnr, _)
				vim.api.nvim_set_option_value("modifiable", false, { buf = bufnr })
			end,

			post_close_hook = function(bufnr, _)
				vim.api.nvim_set_option_value("modifiable", true, { buf = bufnr })
			end,
		},
	},
	{
		"dhruvasagar/vim-table-mode",
		cmd = "TableModeToggle",
		config = function()
			vim.g.table_mode_syntax = 0
			vim.g.table_mode_corner_corner = "+"
		end,
	},
}
