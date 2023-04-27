--Set statusbar
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
    sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename', 'searchcount'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {"os.date('%a')", 'data', "require'lsp-status'.status()", 'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
  },
}

