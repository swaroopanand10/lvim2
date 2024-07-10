return {
	{
		"3rd/image.nvim", -- To make it work install package 'lua51' which lua-5.1.5-11
		-- dependencies = { "vhyrro/luarocks.nvim", opts = { -- will remove it soon
		-- 	rocks = { "magick" },
		-- } },
		ft = { "norg", "markdown" },
		opts = {
			backend = "kitty",
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = true,
					download_remote_images = true,
					only_render_image_at_cursor = true,
					filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
				},
				neorg = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = true,
					filetypes = { "norg" },
				},
				html = {
					enabled = false,
				},
				css = {
					enabled = false,
				},
			},
			max_width = nil,
			max_height = nil,
			max_width_window_percentage = nil,
			max_height_window_percentage = 50,
			window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
			editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
			tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
			hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
		},
	},
	{
		"HakonHarnes/img-clip.nvim",
		event = "LazyFile",
		opts = {
			default = {

				-- relative_to_current_file = true, ---@type boolean
				--
				-- -- I want to save the images in a directory named after the current file,
				-- -- but I want the name of the dir to end with `-img`
				-- dir_path = function()
				-- 	return vim.fn.expand("%:t:r") .. "-img"
				-- end,

				extension = "webp",
				process_cmd = "convert - -quality 70 webp:-",
				template = ".image $FILE_PATH", --for neorg
			},
		},
		keys = {
			-- suggested keymap
			{ "<leader>jip", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		},
	},
}
