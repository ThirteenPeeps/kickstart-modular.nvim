local function gh(repo) return 'https://github.com/' .. repo end

-- Helper func for conditionally adding which-key groups provided
-- which-key is actually available
local function try_wk_add(keys, desc)
  local ok, wk = pcall(require, "which-key")
  if ok then
    wk.add({
      { keys, group = desc },
    })
  end
end

-- [[ mini.nvim ]]
--  A collection of various small independent plugins/modules
vim.pack.add { gh 'nvim-mini/mini.nvim' }

-- If a nerd font is available, load the icons module for pretty icons in various plugins.
if vim.g.have_nerd_font then
  require('mini.icons').setup()
  -- Used for backwards compatibility with plugins that require `nvim-web-devicons` (e.g. telescope.nvim)
  MiniIcons.mock_nvim_web_devicons()
end

-- Better Around/Inside textobjects
--
-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - yiiq - [Y]ank [I]nside [I]+1 [Q]uote
--  - ci'  - [C]hange [I]nside [']quote
require('mini.ai').setup {
  -- NOTE: Avoid conflicts with the built-in incremental selection mappings on Neovim>=0.12 (see `:help treesitter-incremental-selection`)
  mappings = {
    around_next = 'aa',
    inside_next = 'ii',
  },
  n_lines = 500,
}

-- Add/delete/replace surroundings (brackets, quotes, etc.)
--
-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - [S]urround [D]elete [']quotes
-- - sr)'  - [S]urround [R]eplace [)] [']
require('mini.surround').setup()

-- Simple and easy statusline.
--  You could remove this setup call if you don't like it,
--  and try some other statusline plugin
local statusline = require 'mini.statusline'
-- Set `use_icons` to true if you have a Nerd Font
statusline.setup { use_icons = vim.g.have_nerd_font }

-- You can configure sections in the statusline by overriding their
-- default behavior. For example, here we set the section for
-- cursor location to LINE:COLUMN
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function() return '%2l:%-2v' end

-- ... and there is more!
--  Check out: https://github.com/nvim-mini/mini.nvim

require('mini.align').setup()
require('mini.comment').setup()
require('mini.splitjoin').setup()
require('mini.basics').setup({
  options = {
    extra_ui = true,
  },
  mappings = {
    option_toggle_prefix = [[,]],
    move_with_alt = true,
  },
  autocommands = {
    relnum_in_visual_mode = true,
  },
})

require('mini.bracketed').setup()

require('mini.bufremove').setup()
try_wk_add('<Leader>b', 'Mini[B]ufremove')
vim.keymap.set('n', '<Leader>bd', MiniBufremove.delete, { desc = '[B]uffer [d]elete' })
vim.keymap.set('n', '<Leader>bu', MiniBufremove.unshow, { desc = '[B]uffer [u]nshow' })

require('mini.jump').setup()
require('mini.jump2d').setup()

require('mini.sessions').setup({
  autoread = true,
})

require('mini.animate').setup({
  cursor = {
    enable = false,
  },
})

require('mini.map').setup({
  integrations = {
    require('mini.map').gen_integration.diagnostic(),
    require('mini.map').gen_integration.builtin_search(),
    require('mini.map').gen_integration.gitsigns(),
  },
  symbols = {
    encode = require('mini.map').gen_encode_symbols.dot('4x2'),
  },
})
try_wk_add('<leader>m', '[M]iniMap')
vim.keymap.set('n', '<Leader>mf', MiniMap.toggle_focus, { desc = '[M]iniMap [f]ocus toggle' })
vim.keymap.set('n', '<Leader>mr', MiniMap.refresh, {desc = '[M]iniMap [r]efresh' })
vim.keymap.set('n', '<Leader>ms', MiniMap.toggle_side, {desc = '[M]iniMap [s]ide toggle' })
vim.keymap.set('n', '<Leader>mt', MiniMap.toggle, { desc = '[M]iniMap [t]oggle' })

local statuscolumn = require('mini.statuscolumn')
local spec = {
    { format = 'fs=l', sep = ' ' },
    { ltype = 'virt', lnum = '•' },
    { ltype = 'wrap', lnum = '↳' },
    { win = 'inactive', sep = ' ' },
}
statuscolumn.setup({ content = statuscolumn.gen_content.main(spec) })

require('mini.tabline').setup()

-- vim: ts=2 sts=2 sw=2 et
