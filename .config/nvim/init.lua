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
    numbers = "buffer_id"
  }
}
require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "lua", "rust" },
  sync_install = false,
  highlight = { 
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}




