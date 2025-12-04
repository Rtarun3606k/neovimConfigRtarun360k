return {
  -- Smooth Scrolling (best + stable)
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("neoscroll").setup({
        easing_function = "quadratic", -- Smoother animation
        hide_cursor = false,
        respect_scrolloff = true,
      })
    end,
  },

  -- Smooth Cursor Animation (most beautiful)
  {
    "gen740/SmoothCursor.nvim",
    event = "CursorMoved",
    config = function()
      require("smoothcursor").setup({
        autostart = true,
        cursor = "",       -- Pretty arrow cursor
        texthl = "SmoothCursor",
        linehl = nil,
        type = "default",    -- "default", "matrix", "exp"
        fancy = {
          enable = true,     -- Enables tail animation
          head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil },
          body = {
            { cursor = "", texthl = "SmoothCursorRed" },
            { cursor = "", texthl = "SmoothCursorYellow" },
            { cursor = "●",  texthl = "SmoothCursorGreen" },
            { cursor = "•",  texthl = "SmoothCursorAqua" },
          },
          tail = {
            { cursor = "•", texthl = "SmoothCursorBlue" },
            { cursor = ".", texthl = "SmoothCursorPurple" },
          },
        },
        speed = 35,     -- Higher = faster animation
        intervals = 30, -- Lower = smoother
      })
    end,
  },
}

