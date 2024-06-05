-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable autoformat for all files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "*" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- fzf changed keybinds for moving up and down to c-j and c-k
vim.api.nvim_create_autocmd("FileType", {
  pattern = "fzf",
  callback = function(e)
    vim.keymap.set("t", "<C-j>", "<DOWN>", { buffer = e.buf, silent = true })
    vim.keymap.set("t", "<C-k>", "<UP>", { buffer = e.buf, silent = true })
  end,
})

-- feature to disable lualine on first buf entry(immitating vim startup) only once (working)
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  once = true,
  callback = function()
    -- if vim.o.laststatus == 3 then
    vim.o.laststatus = 0
    -- require("lualine").hide({ unhide = false })
    vim.api.nvim_set_hl(0, "Statusline", { fg = "#1b1d2b", bg = "#000000" })
    vim.api.nvim_set_hl(0, "StatuslineNC", { bold = true, fg = "#1b1d2b", bg = "#000000" })
    vim.cmd([[set statusline=%{repeat('─',winwidth('.'))}]])
    -- end
  end,
})

vim.api.nvim_del_augroup_by_name("lazyvim_resize_splits") -- disabling the split resizing after terminal resizing

-- Adding custom compile commads for respective file-types
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "cpp" },
  callback = function()
    vim.keymap.set(
      "n",
      "<C-x>",
      -- "<cmd>:w <bar> silent !g++ -O2 % &>%:p:h/out.txt -o %:p:h/%:r.out && %:p:h/%:r.out < %:p:h/in.txt &> %:p:h/out.txt <cr>",
      "<cmd>:w <bar> silent !g++ % &>%:p:h/out.txt -o %:p:h/bin.out && %:p:h/bin.out < %:p:h/in.txt &> %:p:h/out.txt <cr>",
      { desc = "cpp compilation" }
    )
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c" },
  callback = function()
    vim.keymap.set(
      "n",
      "<C-x>",
      -- "<cmd>:w <bar> silent !gcc -O2 % &>%:p:h/out.txt -o %:p:h/%:r.out && %:p:h/%:r.out < %:p:h/in.txt &> %:p:h/out.txt <cr>",
      "<cmd>:w <bar> silent !gcc % &>%:p:h/out.txt -o %:p:h/bin.out && %:p:h/bin.out < %:p:h/in.txt &> %:p:h/out.txt <cr>",
      { desc = "c compilation" }
    )
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c", "cpp" },
  callback = function()
    vim.keymap.set(
      "n",
      "<C-S-x>",
      -- "<cmd>:!%:p:h/%:r.out < %:p:h/in.txt &> %:p:h/out.txt <cr>",
      "<cmd>:!%:p:h/bin.out < %:p:h/in.txt &> %:p:h/out.txt <cr>",
      { desc = "c,cpp binary exec" }
    )
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "python" },
  callback = function()
    vim.keymap.set("n", "<C-x>", "<cmd>silent !python % < %:p:h/in.txt &> %:p:h/out.txt <cr>", { desc = "node exec" })
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "javascript" },
  callback = function()
    vim.keymap.set("n", "<C-x>", "<cmd>:w <bar> silent !node % &> %:p:h/out.txt <cr>", { desc = "node exec" })
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "rust" },
  callback = function()
    vim.keymap.set(
      "n",
      "<C-x>",
      "<cmd>:w <bar> silent !rustc % &>%:p:h/out.txt -o %:p:h/%:r && %:p:h/%:r < %:p:h/in.txt &> %:p:h/out.txt <cr>",
      { desc = "node exec" }
    )
  end,
})
