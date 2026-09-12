vim.pack.add { 'https://github.com/Mofiqul/dracula.nvim' }

require('dracula').setup {
  transparent_bg = true,
  show_end_of_buffer = true,
  italic_comment = true,
}

vim.cmd.colorscheme 'dracula'
