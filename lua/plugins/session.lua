return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = { options = { "buffers", "curdir", "tabpages", "winsize" } },
  keys = {
    { "<leader>qs", function() require("persistence").load() end, desc = "Restore last session" },
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore previous session" },
    { "<leader>qd", function() require("persistence").stop() end, desc = "Disable session" },
  },
}

