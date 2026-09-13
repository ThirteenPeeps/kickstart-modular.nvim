vim.pack.add { 'https://github.com/Mofiqul/dracula.nvim' }

require('dracula').setup {
  transparent_bg = true,
  show_end_of_buffer = true,
  italic_comment = true,

  overrides = function (colors)
    return {
    MiniStatuslineDevinfo = { fg = colors.purple, bg = colors.menu },
    MiniStatuslineFilename = { bold = true, fg = colors.white, bg = colors.menu },
    MiniStatuslineFileinfo = { fg = colors.purple, bg = colors.menu },
    MiniStatuslineInactive = { fg = colors.white, bg = colors.menu },
    CursorLineNr = { bold = true, fg = colors.white, bg = colors.bg },
    CursorLine = { bg = colors.menu },
    ColorColumn = { bg = colors.menu },
  }
  end,
}

vim.cmd.colorscheme 'dracula'
