return {
  "nvim-telescope/telescope.nvim",
  version = "*",   -- pin to latest tagged release (the 0.1.x branch is obsolete)
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- faster sorting, optional
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>" },  -- uses the ripgrep you already have
    { "<leader>fb", "<cmd>Telescope buffers<CR>" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>" },
  },
}
