vim.pack.add {{ src = 'https://github.com/s1n7ax/nvim-window-picker', version = vim.version.range '2.*' }}

require('window-picker').setup {
  hint = 'floating-big-letter',
  picker_config = {
    handle_mouse_click = true,
  }
}
