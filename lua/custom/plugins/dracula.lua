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
    MiniTablineCurrent = { bold = true, fg = colors.white, bg = colors.menu },
    MiniTablineModifiedCurrent = { bold = true, italic = true, fg = colors.white, bg = colors.menu },
    MiniTablineModifiedVisible = { italic = true, fg = colors.white, bg = colors.bg },
    MiniTablineModifiedHidden = { italic = true, fg = colors.comment, bg = colors.bg },
  }
  end,
}

vim.cmd.colorscheme 'dracula'
