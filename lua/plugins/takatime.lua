return {
  {
    -- Keep this pointing to your local folder
    -- dir = "/home/dragoon/coding/taka-time.nvim",
    "Rtarun3606k/TakaTime",

    lazy = false,
    config = function()
      require("taka-time").setup {
        -- mongo_uri = "mongodb://localhost:27017/takatime",

        -- ✅ Leave it empty to test :TakaInit logic!
        debug = false, -- Optional: Keep debug on to see print statements
      }
    end,
  },
}
