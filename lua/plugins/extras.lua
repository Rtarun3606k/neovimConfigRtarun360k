return {
  -- 1. Auto-Close Brackets
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },

  -- 2. Git Signs (Sidebar colors)
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- 3. Status Bar
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          component_separators = '|',
          section_separators = '',
        },
      })
    end,
  },

  -- 4. Comments (Ctrl + /)
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()

      local api = require("Comment.api")

      -- Toggle current line (Normal Mode)
      -- We map both C-/ and C-_ because some terminals send C-/ as C-_
      vim.keymap.set("n", "<C-/>", api.toggle.linewise.current)
      vim.keymap.set("n", "<C-_>", api.toggle.linewise.current)

      -- Toggle selection (Visual Mode)
      vim.keymap.set("x", "<C-/>", function()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
        api.toggle.linewise(vim.fn.visualmode())
      end)
      vim.keymap.set("x", "<C-_>", function()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
        api.toggle.linewise(vim.fn.visualmode())
      end)
    end,
  },
  -- The Minimap (Code Preview on the right)
  {
    "gorbit99/codewindow.nvim",
    config = function()
      local codewindow = require("codewindow")
      codewindow.setup({
        auto_enable = true,       -- Open automatically when you enter a file
        minimap_width = 10,       -- How wide the preview is
        use_git = true,           -- Show git changes in the minimap too
        window_border = "rounded" -- Soft rounded corners
      })

      -- 🎨 Custom Border Color (Dark Purple/Grey)
      vim.api.nvim_set_hl(0, "CodewindowBorder", { fg = "#585b70" })

      -- ⌨️ THE COMMAND / SHORTCUT
      -- Press Space + m to toggle it On/Off
      vim.keymap.set("n", "<leader>m", codewindow.toggle_minimap, { desc = "Toggle Minimap" })
    end,
  },

}
