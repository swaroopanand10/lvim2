return {
  {
    "olimorris/persisted.nvim",
    config = true,
    keys = {
      {
        "<leader>js",
        "<cmd>lua require('persisted').load()<cr>",
        -- silent = true,
        desc = "Restore persisted Session",
      },
      {
        "<leader>jt",
        ":lua require('telescope').load_extension('persisted')<cr> <bar> :Telescope persisted<cr>",
        silent = true,
        desc = "telescope persisted",
      },
      {
        "<leader>jS",
        "<cmd>SessionSave<cr>",
        -- silent = true,
        desc = "session save",
      },

      {
        "<leader>jD",
        "<cmd>SessionDelete<cr>",
        -- silent = true,
        desc = "session delete",
      },
    },
    opts = {
      -- save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
      -- save_dir = "/home/swaroop/.config/nvim/sessions/", --changed the session directory
      save_dir = vim.fn.expand(vim.fn.stdpath("config") .. "/sessions/"),
      -- silent = false, -- silent nvim message when sourcing session file
      -- use_git_branch = false, -- create session files based on the branch of the git enabled repository
      autosave = false, -- automatically save session files when exiting Neovim
      -- should_autosave = nil, -- function to determine if a session should be autosaved
      -- autoload = false, -- automatically load the session for the cwd on Neovim startup
      -- on_autoload_no_session = nil, -- function to run when `autoload = true` but there is no session to load
      -- follow_cwd = true, -- change session file name to match current working directory if it changes
      -- allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
      -- ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
      -- telescope = { -- options for the telescope extension
      --   reset_prompt_after_deletion = true, -- whether to reset prompt after session deleted
      -- },
    },
  },
  -- {
  --   "ahmedkhalf/project.nvim",
  --   opts = {
  --     -- cwd = pwd, rootdir = the latest directory containing file, we can chech both through neotree keybinding in whichkey
  --     detection_methods = { "pattern", "lsp" },
  --   },
  --   keys = {
  --     {
  --       "<leader>jd",
  --       "<cmd>lcd %:p:h<cr>",
  --       -- silent = true,
  --       desc = "change cwd to curbuf-dir",
  --     },
  --
  --     {
  --       "<leader>jp",
  --       "<cmd>:ProjectRoot<cr>",
  --       -- silent = true,
  --       desc = "run :projectroot to change the cwd by project.nvim",
  --     },
  --   },
  -- },
}
