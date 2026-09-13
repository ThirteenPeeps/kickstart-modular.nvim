vim.pack.add { 'http://github.com/MeanderingProgrammer/render-markdown.nvim'}

require('render-markdown').setup({
  completions = { lsp = { enabled = true } },
})

-- vim: ts=2 sts=2 sw=2 et
