return {
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},

	opts = function(_, opts)
		-- local cmp = require("cmp")
		-- opts.mapping = cmp.mapping.preset.insert({ -- this will override all the mappings and is working
		-- 	["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		-- 	["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		-- 	["<C-p>"] = cmp.mapping.scroll_docs(-4),
		-- 	["<C-n>"] = cmp.mapping.scroll_docs(4),
		-- 	["<C-Space>"] = cmp.mapping.complete(),
		-- 	["<C-e>"] = cmp.mapping.abort(),
		-- 	["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item in this case.
		-- 	["<S-CR>"] = cmp.mapping.confirm({
		-- 		behavior = cmp.ConfirmBehavior.Replace,
		-- 		select = true,
		-- 	}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		-- 	["<C-CR>"] = function(fallback)
		-- 		cmp.abort()
		-- 		fallback()
		-- 	end,
		-- })
		-- table.insert( -- this is not working
		-- 	opts.mapping,
		-- 	cmp.mapping.preset.insert({
		-- 		["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		-- 		["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		-- 		["<C-p>"] = cmp.mapping.scroll_docs(-4),
		-- 		["<C-n>"] = cmp.mapping.scroll_docs(4),
		-- 		["<C-Space>"] = cmp.mapping.complete(),
		-- 		["<C-e>"] = cmp.mapping.abort(),
		-- 		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item in this case.
		-- 		["<S-CR>"] = cmp.mapping.confirm({
		-- 			behavior = cmp.ConfirmBehavior.Replace,
		-- 			select = true,
		-- 		}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		-- 		["<C-CR>"] = function(fallback)
		-- 			cmp.abort()
		-- 			fallback()
		-- 		end,
		-- 	})
		-- )
		table.insert(opts.sources, { name = "neorg" })
	end,
}
