return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- Configure Catppuccin
      require("catppuccin").setup({
        transparent_background = true, -- This turns on the transparency
        
        -- This ensures your other plugins look good on a transparent background
        integrations = {
          neotree = true,
          mason = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
        },
      })

      -- Set the specific flavor
      vim.cmd.colorscheme "catppuccin-mocha"
    end
  }
}
