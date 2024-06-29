-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local opts = { silent = true }

-- Exiting insert mode
map("i", "jk", "<Esc>", opts)
map("i", "kj", "<Esc>", opts)

-- Switching to last buffer
map("n", "<C-b>", "<C-6>", opts)
map("i", "<C-b>", "<cmd>e #<cr>", opts)

-- Paste only last yanked text keybinds
map("n", "yp", '"0p', opts)
map("n", "yP", '"0P', opts)

-- Resizing window sizes
map("n", "<C-h>", ":vertical resize -2<CR>", opts)
map("n", "<C-k>", ":resize -2<CR>", opts)
map("n", "<C-j>", ":resize +2<CR>", opts)
map("n", "<C-l>", ":vertical resize +2<CR>", opts)

-- Switching between windows
map("n", "<A-h>", "<C-w>h", opts)
map("n", "<A-j>", "<C-w>j", opts)
map("n", "<A-k>", "<C-w>k", opts)
map("n", "<A-l>", "<C-w>l", opts)

-- Move to line beginning and end
map({ "n", "v", "x" }, "gl", "$", { desc = "End of line" })
map({ "n", "v", "x" }, "gh", "^", { desc = "Beginning of line" })

-- Stopping lsp
map("n", "<leader>jL", "<cmd>LspStop<cr>", { desc = "stop lsp", silent = true })

-- Finding about the directories info
map("n", "<leader>jl", "<cmd>LazyRoot<cr>", { desc = "lazyroot command", silent = true })

-- Nvim-cmp goint to next line without selecting any entry
map("i", "<A-cr>", "<c-j>", { desc = "abort cmp then press enter", silent = true })

-- Changing cwd to directory of current buffer
map("n", "<leader>jd", "<cmd>lcd %:p:h<cr>", { desc = "change the cwd to directory of current buffer" })

-- Quiting neovim after saving without prompt
map({ "n", "i" }, "<C-q>", "<cmd>wqa<cr>", { desc = "quit all after saving" })
map({ "n", "i" }, "<C-S-q>", "<cmd>qa!<cr>", { desc = "quit all without saving" })

-- mapping for scrolling up and down
map("n", "<A-r>", "<C-y>", opts)
map("n", "<A-e>", "<C-e>", opts)

-- Keymap for toggling winbar
map("n", "<leader>jb", function()
	-- local current_win = vim.fn.winnr()
	local winbar_exists = false

	-- Check if winbar exists
	for _, winid in ipairs(vim.fn.getwininfo()) do
		if winid.winbar == 1 then
			winbar_exists = true
			break
		end
	end
	if winbar_exists then
		vim.o.winbar = nil
	else
		vim.o.winbar = " %t %m"
	end
end, { desc = "toggle winbar", silent = true })

-- Keymap for toggling statusbar
map("n", "<leader>jx", function()
	if vim.o.laststatus == 3 then
		vim.o.laststatus = 0
		require("lualine").hide({ unhide = false })
		vim.api.nvim_set_hl(0, "Statusline", { fg = "#1b1d2b", bg = "#000000" })
		vim.api.nvim_set_hl(0, "StatuslineNC", { bold = true, fg = "#1b1d2b", bg = "#000000" })
		vim.cmd([[set statusline=%{repeat('─',winwidth('.'))}]])
	else
		require("lualine").hide({ unhide = true })
		vim.o.laststatus = 3
		vim.api.nvim_set_hl(0, "Statusline", {})
		vim.api.nvim_set_hl(0, "StatuslineNC", { fg = "#3b4261" })
	end
end, { desc = "toggle statusbar", silent = true })
