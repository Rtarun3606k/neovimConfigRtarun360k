return {
  -- 1. FUGITIVE (the :G command)
  {
    "tpope/vim-fugitive"
  },

  -- 2. GITSIGNS (the icons in the gutter)
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      -- Your existing Gitsigns shortcuts
      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
    end
  },

  -- 3. LAZYGIT (the new visual UI)
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      -- Add your new keymap here
      vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Git: Open LazyGit" })
    end
  }
}
