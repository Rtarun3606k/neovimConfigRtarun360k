-- Inside lua/plugins/visuals.lua
return{
-- Indent Guides (The vertical lines)
-- Inside lua/plugins/visuals.lua

{
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = { char = "┊" },
    -- 1. ENABLE SCOPE (This turns on the block highlighting)
    scope = { 
      enabled = true,
      show_start = false, -- Turn off the start underline for a cleaner look
      show_end = false,   -- Turn off the end underline
    },
  },
  config = function(_, opts)
    -- 2. SET COLORS
    
    -- "IblIndent": The inactive lines (Make these very dark/subtle)
    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#303030" }) 
    
    -- "IblScope": The ACTIVE line (The block your cursor is inside)
    -- I set this to a slightly lighter gray so it stands out, but is still "dark"
    vim.api.nvim_set_hl(0, "IblScope", { fg = "#707070" }) 

    require("ibl").setup(opts)
  end,
},
}
