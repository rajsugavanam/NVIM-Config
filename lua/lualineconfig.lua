require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = '',
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
		  statusline = {},
		  winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 100,
			tabline = 100,
			winbar = 100,
		}
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = '', right = '' } } },
    lualine_b = { 'branch', 'diff'},
    lualine_c = {
        { 'buffers', symbols = {
            modified = ' ●',
            alternate_file = '#',
            directory =  '', },
        },
        'diagnostics'
    },
    lualine_x = {'lsp_status', 'filetype'},
    lualine_y = {'filesize', 'encoding', 'progress', 'searchcount'},
    lualine_z = { { 'location', separator = { left = '', right= '' } } }
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
  inactive_winbar = {
  },
  extensions = {}
}
