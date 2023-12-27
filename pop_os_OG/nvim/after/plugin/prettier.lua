vim.api.nvim_exec([[
  augroup PrettierAutoFormat
    autocmd!
    autocmd BufWritePost *.js,*.jsx,*.json,*.ts,*.tsx,*.css,*.scss,*.md,*.html :PrettierAsync
  augroup END
]], false)
