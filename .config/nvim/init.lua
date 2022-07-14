--[[ init.lua ]]

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plugins')      -- Plugins

require('Comment').setup()
require'nvim-tree'.setup {
  disable_netrw = true,
  update_focused_file = {
    enable = true,
  },
  view = {
    side = 'bottom',
    height = 15,
  },
  actions ={
    open_file={
      quit_on_open = true,
    }
  }
}
require("bufferline").setup{
  options = {
  }
}
require("indent_blankline").setup {
    show_current_context = true,
}
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "lua", "rust","bash" },
  sync_install = false,
  highlight = { 
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}

  local home = os.getenv('HOME')
  local db = require('dashboard')
  db.preview_command = 'sudo batcat | lolcat -F 0.3'
  db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
  db.preview_file_height = 12
  db.preview_file_width = 80
  db.custom_center = {
      {icon = '  ',
      desc = 'Recently latest session                  ',
      shortcut = 'SPC s l',
      action ='SessionLoad'},
      {icon = '  ',
      desc = 'Recently opened files                   ',
      action =  'DashboardFindHistory',
      shortcut = 'SPC f h'},
      {icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC f f'},
      {icon = '  ',
      desc ='File Browser                            ',
      action =  'Telescope file_browser',
      shortcut = 'SPC f b'},
      {icon = '  ',
      desc = 'Find  word                              ',
      action = 'Telescope live_grep',
      shortcut = 'SPC f w'},
      {icon = '  ',
      desc = 'Open Personal dotfiles                  ',
      action = 'Telescope dotfiles path=' .. home ..'/.dotfiles',
      shortcut = 'SPC f d'},
    }
  db.custom_header = {
	'     ████               ████       ',
	'    ███                   ███      ',
	'   ███                     ███     ',
	'  ███                       ███    ',
	' ███                         ███   ',
	'████                         ████  ',
	'████                         ████  ',
	'██████       ███████       ██████  ',
	'█████████████████████████████████  ',
	' ███████████████████████████████   ',
	'  ████ ███████████████████ ████    ',
	'       ███▀███████████▀███         ',
	'      ████──▀███████▀──████        ',
	'      █████───█████───█████        ',
	'       ███████████████████         ',
	'        █████████████████          ',
	'         ███████████████           ',
	'          █████████████            ',
	'           ███████████             ',
	'          ███──▀▀▀──███            ',
	'          ███─█████─███            ',
	'           ███─███─███             ',
	'            █████████              ',
	 }

