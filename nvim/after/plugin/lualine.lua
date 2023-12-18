local custom_gruvbox = require'lualine.themes.nord'

custom_gruvbox.normal.c.bg = '#222831'

require('lualine').setup {
  options = { theme  = custom_gruvbox },
}
