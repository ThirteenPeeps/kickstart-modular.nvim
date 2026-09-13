-- Enable faster startup by caching compiled Lua modules
vim.loader.enable()

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 0

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Draw margin at specified column number(s)
vim.opt.colorcolumn = { 80, 120 }

-- Don't skip over _ when traversing words, for parity with Fish
vim.opt.iskeyword:remove '_'

-- vim: ts=2 sts=2 sw=2 et
