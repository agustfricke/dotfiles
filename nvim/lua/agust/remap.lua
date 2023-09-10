vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Configuración para formatear automáticamente con Prettier al guardar
vim.api.nvim_exec([[
  augroup PrettierAutoFormat
    autocmd!
    autocmd BufWritePost *.js,*.jsx,*.json,*.ts,*.tsx,*.css,*.scss,*.md,*.html :PrettierAsync
  augroup END
]], false)
