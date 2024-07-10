return {
	"nvim-neorg/neorg",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-neorg/neorg-telescope" },
		{ "nvim-telescope/telescope.nvim" },
		-- { "vhyrro/luarocks.nvim" },
		{
			"hrsh7th/nvim-cmp", -- adding neorg to source table of cmp
			opts = function(_, opts)
				table.insert(opts.sources, { name = "neorg" })
			end,
		},
	},
	keys = {
		{
			"<leader>in",
			"<cmd>:Neorg<cr>",
			silent = true,
			desc = "neorg menu",
		},
		{
			"<leader>ip",
			"<cmd>:Neorg sync-parsers<cr>",
			silent = true,
			desc = "Neorg sync-parsers",
		},
		{
			"<leader>ii",
			"<cmd>:Neorg index<cr>",
			silent = true,
			desc = "Neorg index",
		},
		{
			"<leader>iw",
			"<cmd>:Telescope neorg switch_workspace<cr>",
			silent = true,
			desc = "Neorg switch workspace",
		},

		{
			"<leader>il",
			"<cmd>:Telescope neorg find_linkable<cr>",
			silent = true,
			desc = "Neorg find_linkable in current workspace",
		},

		{
			"<leader>ih",
			"<cmd>:Telescope neorg search_headings<cr>",
			silent = true,
			desc = "Neorg search headings in current file",
		},
		{
			"<leader>if",
			"<cmd>:Telescope neorg find_norg_files<cr>",
			silent = true,
			desc = "Neorg search files in current workspace",
		},
		{
			"<leader>ir",
			"<cmd>:Neorg return<cr>",
			silent = true,
			desc = "Neorg return",
		},
		{
			"<leader>im",
			"<cmd>:Neorg inject-metadata<cr>",
			silent = true,
			desc = "Neorg inject-metadata",
		},
		{
			"<leader>is",
			"<cmd>:Neorg generate-workspace-summary<cr>",
			silent = true,
			desc = "Neorg generate-workspace-summary",
		},
		{
			"<leader>ij",
			"<cmd>:Neorg journal<cr>",
			silent = true,
			desc = "Neorg journal menu",
		},
		{
			"<leader>ik",
			"<cmd>:Neorg keybind all<cr>",
			silent = true,
			desc = "Neorg keybind all",
		},
		{
			"<leader>ie",
			"<cmd>:Neorg keybind all core.integrations.telescope.insert_link<cr>",
			silent = true,
			desc = "insert link",
		},
		{
			"<leader>ia",
			"<cmd>:Neorg keybind all core.integrations.telescope.insert_file_link<cr>",
			silent = true,
			desc = "insert file link",
		},
	},
	ft = "norg", -- lazy load on filetype
	-- cmd = "Neorg", -- lazy load on command, allows you to autocomplete :Neorg regardless of whether it's loaded yet
	--  (you could also just remove both lazy loading things)
	-- priority = 30, -- treesitter is on default priority of 50, neorg should load after it.
	-- build = ":Neorg sync-parsers", -- not needed after the update to 0.8
	opts = {
		load = {
			["core.defaults"] = {}, -- Loads default behaviour
			["core.concealer"] = {}, -- Adds pretty icons to your documents
			["core.dirman"] = { -- Manages Neorg workspaces
				config = {
					workspaces = {
						tj = "~/tj",
						cprg = "~/notes/n-cprg",
						cppprg = "~/notes/n-cppprg",
						cn = "~/notes/n-cn",
						comparch = "~/notes/n-comparch",
						computing = "~/notes/n-computing",
						rs = "~/notes/n-rs",
						asm = "~/notes/n-asm",
						os = "~/notes/n-os",
						wayland = "~/notes/n-wayland",
						gtk = "~/notes/n-gtk",
						gtkmm = "~/notes/n-gtkmm",
						unix = "~/notes/n-unix",
						js = "~/notes/n-js",
						css = "~/notes/n-css",
						cf = "~/notes/n-cf",
						linux = "~/notes/n-linux",
						projects = "~/notes/n-projects",
						algo = "~/notes/n-algo",
						ds = "~/notes/n-ds",
						dbms = "~/notes/n-dbms",
						math = "~/notes/n-math",
						cg = "~/notes/n-cg",
						sdl = "~/notes/n-sdl",
						opengl = "~/notes/n-opengl",
						scratchpad = "~/notes/n-scratchpad",
						["42"] = "~/notes/n-42",
					},
					default_workspace = nil, -- doing this is best as it puts us in workspace of current dir
					index = "index.norg",
					-- open_last_workspace = true, -- not working
				},
			},
			["core.integrations.telescope"] = {},
			["core.completion"] = {
				config = {
					engine = "nvim-cmp",
				},
			},
			["core.export"] = {},
			["core.summary"] = {},
			["core.ui"] = {},
			["core.ui.calendar"] = {},
		},
	},
}
