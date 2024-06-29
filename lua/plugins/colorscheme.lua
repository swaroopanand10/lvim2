return {
	{
		"LazyVim/LazyVim",
		opts = {
			-- colorscheme = "rose-pine",
			colorscheme = "tokyonight",
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = {
			style = "night",
			transparent = true, -- Enable this to disable setting the background color
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			lualine_bold = true,
			on_colors = function(colors)
				colors.hint = colors.orange
				colors.error = "#ff0000"
				colors.bg_dark = "#000000"
				colors.bg = "#000000"
				colors.bg_float = "#000000"
				colors.bg_highlight = "#000101"
				-- colors.bg_highlight = "#0C090A"
				-- colors.bg_highlight = "#313955" --from treesitter-context
				colors.bg_popup = "#000000"
				colors.bg_sidebar = "#000000"
				colors.bg_statusline = "#000000"
			end,
			on_highlights = function(hl, c)
				local dark = "#000101"
				-- local visualdark = "#2d3f76"
				-- local red = "#ff0000"
				local red1 = "#F92660"
				-- local black = "#000000"
				-- local blue = "#52b0ef"
				-- local purple = "#fca7ea"
				local fg_color = "#E0DEF4"
				hl.TreesitterContext = {
					bg = dark,
				}
				hl.TreesitterContextBottom = {
					underline = true,
					bold = true,
					-- sp = purple,
					sp = "#65BCFF", -- color of indent-blankline copied from hyprland -color-picker
				}
				hl.Cursor = { -- setting cursor colors(only work if vim.o.guicursor will be set in options)
					bg = red1,
				}
				hl.FlashBackdrop = { fg = "#545c7e" }
				hl.FlashLabel = {
					bg = "#ff007c",
					bold = true,
					fg = "#ffffff",
				}
				hl.WinBar = { fg = "#ffffff" } -- Window bar of current window
				hl.WinBarNC = { fg = "#ffffff" } -- Window bar of not-current windows

				-- Here I modified all the hightlights to make the text full white
				hl.Constant = { fg = fg_color } -- (*) Any constant
				hl.String = { fg = fg_color } --   A string constant: "this is a string"
				hl.Character = { fg = fg_color } --   A character constant: 'c', '\n'
				hl.Number = { fg = fg_color } --   A number constant: 234, 0xff
				hl.Boolean = { fg = fg_color } --   A boolean constant: TRUE, false
				hl.Float = { fg = fg_color } --   A floating point constant: 2.3e10

				hl.Identifier = { fg = fg_color } -- (*) Any variable name
				hl.Function = { fg = fg_color } --   Function name (also: methods for classes)

				hl.Statement = { fg = fg_color } -- (*) Any statement
				hl.Conditional = { fg = fg_color } --   if, then, else, endif, switch, etc.
				hl.Repeat = { fg = fg_color } --   for, do, while, etc.
				hl.Label = { fg = fg_color } --   case, default, etc.
				hl.Operator = { fg = fg_color } --   "sizeof", "+", "*", etc.
				hl.Keyword = { fg = fg_color } --   any other keyword
				hl.Exception = { fg = fg_color } --   try, catch, throw

				hl.PreProc = { fg = fg_color } -- (*) Generic Preprocessor
				hl.Include = { fg = fg_color } --   Preprocessor #include
				hl.Define = { fg = fg_color } --   Preprocessor #define
				hl.Macro = { fg = fg_color } --   Same as Define
				hl.PreCondit = { fg = fg_color } --   Preprocessor #if, #else, #endif, etc.

				hl.Type = { fg = fg_color } -- (*) int, long, char, etc.
				hl.StorageClass = { fg = fg_color } --   static, register, volatile, etc.
				hl.Structure = { fg = fg_color } --   struct, union, enum, etc.
				hl.Typedef = { fg = fg_color } --   A typedef

				hl.Special = { fg = fg_color } -- (*) Any special symbol
				hl.SpecialChar = { fg = fg_color } --   Special character in a constant
				hl.Tag = { fg = fg_color } --   You can use CTRL-] on this
				hl.Delimiter = { fg = fg_color } --   Character that needs attention
				hl.SpecialComment = { fg = fg_color } --   Special things inside a comment (e.g. '\n')
				hl.Debug = { fg = fg_color } --   Debugging statements
				hl["@keyword"] = { link = "Keyword" }
				hl["@variable"] = { link = "Identifier" }
 				hl["@function"] = { link = "Function" }
				hl["@type.builtin"] = { link = "@keyword" }
				hl["@keyword.function"] = { link = "@keyword" }
				hl["@variable.builtin"] = { link = "@variable" }
				hl["@variable.member"] = { link = "@variable" }
				hl["@variable.parameter"] = { link = "@variable" }
				hl["@property"] = { link = "@variable" }
				hl["@constructor"] = { link = "Function" }
				hl["@lsp.typemod.type.defaultLibrary"] = { link = "Type" }
			end,
		},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			groups = {
				error = "#ff0000",
				hint = "#ff966c",
			},
			variant = "moon", -- auto, main, moon, or dawn
			dark_variant = "moon", -- main, moon, or dawn
			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
			highlight_groups = {
				-- Comment = { fg = "foam" },
				-- VertSplit = { fg = "muted", bg = "muted" },
				StatusLine = {
					bg = "#000000",
					fg = "#000000",
				},
				StatusLineNC = {
					bg = "#000000",
					fg = "#000000",
				},
				TreesitterContextBottom = {
					underline = true,
				},
				FlashBackdrop = { fg = "#545c7e" },
				FlashLabel = {
					bg = "#ff007c",
					bold = true,
					fg = "#ffffff",
					-- fg = "#000000",
				},
				Cursor = { -- setting cursor colors(only work if vim.o.guicursor will be set in options)
					bg = "#F92660",
				},

				NotifyBackground = {
					-- fg = c.fg,
					bg = "#000000",
				},
				CursorLine = {
					bg = "#000000",
				},
				FlashMatch = {
					bg = "#000000",
					fg = "#ffffff",
				},
				Search = {
					bg = "#3E68D7",
					fg = "#c8d3f5",
				},
			},
		},
	},
}
