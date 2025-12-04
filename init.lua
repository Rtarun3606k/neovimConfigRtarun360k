 local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end





vim.opt.rtp:prepend(lazypath)

require("vim-options")



-- 3. Load ALL plugins (including persistence.nvim)
require("lazy").setup("plugins")

-- 4. Auto-restore last session when NO file was passed
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      local ok, persistence = pcall(require, "persistence")
      if ok then
        persistence.load()
      end
    end
  end,
})

-- ADD YOUR NEW KEYMAP HERE --
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })
vim.diagnostic.config({ virtual_text = true, signs = true })

-- Tab Management Shortcuts fro tab close and tab new commands -- 
-- Tab Management Shortcuts (Renamed to avoid conflict with Test)
vim.keymap.set("n", "<leader>nt", ":tabnew<CR>", { desc = "New Tab" })
vim.keymap.set("n", "<leader>dt", ":tabclose<CR>", { desc = "Delete/Close Tab" })

-- 1. CLIPBOARD SETUP (Make 'y' copy to system clipboard)
-- Without this, you cannot paste outside of Neovim!
vim.opt.clipboard = "unnamedplus"

-- 2. MOVE LINES UP AND DOWN (Ctrl + Up/Down Arrow)
-- Normal Mode
vim.keymap.set("n", "<C-Up>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<C-Down>", ":m .+1<CR>==", { desc = "Move line down" })

-- Visual Mode
vim.keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- 3. DUPLICATE LINES (Leader + d)
-- Duplicate Line (Ctrl + Shift + Down Arrow)
-- Works better than <C-S-d> because terminals don't confuse it with scrolling

-- Normal Mode: Yank current line (yy) and paste below (p)
vim.keymap.set("n", "<leader>d", "yyp", { desc = "Duplicate line down" })

-- Visual Mode: Yank selection (y), go to bottom of selection ('>), paste (p)
vim.keymap.set("v", "<leader>d", "y'>p", { desc = "Duplicate selection down" })

-- Ctrl + Enter to Insert New Line Below
-- Insert Mode: Exit insert (Esc), Open new line below (o)
vim.keymap.set("i", "<C-Enter>", "<Esc>o", { desc = "New line below" })

-- Normal Mode: Just run 'o'
vim.keymap.set("n", "<C-Enter>", "o", { desc = "New line below" })

-- 1. Visual Mode (Select text, then press Tab or Shift+Tab)
-- The 'gv' at the end keeps the selection active so you can press it multiple times!
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent selection" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Outdent selection" })

-- 2. Normal Mode (Just press Tab or Shift+Tab on the current line)
vim.keymap.set("n", "<Tab>", ">>", { desc = "Indent line" })
vim.keymap.set("n", "<S-Tab>", "<<", { desc = "Outdent line" })
 
-- TEXT WRAP SETTINGS -----------------------------

-- 1. Enable Wrap
vim.opt.wrap = true

-- 2. Wrap at words (don't break in the middle of a word)
vim.opt.linebreak = true

-- 3. Fix Navigation (Make j/k move visually over wrapped lines)
-- Normal Mode
vim.keymap.set("n", "j", "gj", { desc = "Move down visual line" })
vim.keymap.set("n", "k", "gk", { desc = "Move up visual line" })
vim.keymap.set("n", "<Down>", "gj", { desc = "Move down visual line" })
vim.keymap.set("n", "<Up>", "gk", { desc = "Move up visual line" })

-- Visual Mode (So you can select wrapped parts easily)
vim.keymap.set("v", "j", "gj", { desc = "Move down visual line" })
vim.keymap.set("v", "k", "gk", { desc = "Move up visual line" })
vim.keymap.set("v", "<Down>", "gj", { desc = "Move down visual line" })
vim.keymap.set("v", "<Up>", "gk", { desc = "Move up visual line" })
