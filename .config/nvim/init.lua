--[[ init.lua ]]

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plugins')      -- Plugins

require("bufferline").setup{}
--require('nvim-autopairs').setup{}
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
require'nvim-treesitter.configs'.setup {
   -- A list of parser names, or "all"
  ensure_installed = { "javascript", "typescript", "lua", "rust" },
   -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  highlight = { 
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}
vim.cmd [[
filetype plugin indent on
colorscheme everforest
let g:everforest_background = 'soft'
let g:everforest_enable_italic = 1
let g:everforest_better_performance = 1
let g:coc_global_extensions=['coc-git', 'coc-cssmodules', 'coc-marketplace', 'coc-prisma', 'coc-webpack',  'coc-tabnine', 'coc-tslint-plugin', 'coc-simple-react-snippets', 'coc-snippets', 'coc-html', 'coc-rls', 'coc-pairs',  'coc-prettier', 'coc-json', 'coc-highlight', 'coc-emmet', 'coc-spell-checker', 'coc-tsserver', 'coc-word', 'coc-css', 'coc-smartf', 'coc-fzf-preview', 'coc-explorer', 'coc-rust-analyzer']
  ]]



