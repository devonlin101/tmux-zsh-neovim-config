"vim plug plugin ######/*{*/
call plug#begin('~/.vim/plugged') 
  "Plug 'tpope/vim-fugitive'
  "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
  Plug 'honza/vim-snippets'
  Plug 'sainnhe/everforest'
  Plug 'sheerun/vim-polyglot'
  Plug 'itchyny/lightline.vim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'junegunn/fzf.vim' " needed for previews
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()
"/*}*/
"set configurations /*{*/ 
"set cursorline
set termguicolors     " enable true colors support
set title
set hidden
set nobackup
set smartcase
set linebreak
set ignorecase
set noshowmode
set relativenumber
set nowritebackup
set splitbelow splitright
set t_Co=256
set mouse=a
set history=200
set foldcolumn=1
set shortmess+=c
set showtabline=2
set updatetime=300
set encoding=utf-8
set foldmethod=marker
set foldlevelstart=99
set foldmarker=/*{*/,/*}*/
set timeoutlen=1000 ttimeoutlen=0
set tabstop=3 softtabstop=2 shiftwidth=2 expandtab
set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70
"set spell spelllang=en
"set laststatus=0
"set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
"set statusline=[%n]%<%f\ %y%h%m%r%=%-14.(%l/%L:%c%V%)\%p%%
"set statusline=%{coc#status()}%{get(b:,'coc_current_function','')}
syntax enable
filetype plugin indent on
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
"/*}*/
"let configurations /*{*/

" function set lightline statusbar and tabline background to transparent
autocmd VimEnter * call SetupLightlineColors()
function SetupLightlineColors() abort
  " transparent background in statusbar
  let l:palette = lightline#palette()

  let l:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
  let l:palette.inactive.middle = l:palette.normal.middle
  let l:palette.tabline.middle = l:palette.normal.middle

  call lightline#colorscheme()
endfunction

"lightline configurations
     let g:lightline = {
           \'colorscheme':'everforest',
		\ 'component': {
		\   'lineinfo':' %3l:%-2v',
		\ },
      \ 'active' : {
        \ 'left' : [ [ 'mode', 'paste'],
		    \           ['git', 'diagnostic', 'readonly',  'method','relativepath', 'modified' ] ],
		    \ 'right' : [ [ 'lineinfo' ], [ 'percent', ],[ 'filetype' ] ],
         \ },
		\ 'separator': { 'left': '', 'right': '' },
		\ 'subseparator': { 'left': '', 'right': '' },
      \ 'mode_map': {
   		    \ 'n' : 'N',
		    \ 'i' : 'I',
		    \ 'R' : 'R',
		    \ 'v' : 'V',
		    \ 'V' : 'V-L',
		    \ "\<C-v>": 'V-B',
		    \ 'c' : 'C',
		    \ 's' : 'S',
		    \ 'S' : 'S-L',
		    \ "\<C-s>": 'S-B',
		    \ 't': 'T',
       \ }
		\ } 

"let g:everforest_diagnostic_text_highlight = 1
"let g:everforest_diagnostic_line_highlight = 1
"let g:everforest_diagnostic_virtual_text = 'colored'
"let g:everforest_sign_column_background = 'none'
"let g:everforest_show_eob=0
let g:everforest_background = 'soft' " 'hard', 'medium', '' 
let g:everforest_enable_italic = 1
let g:everforest_current_word = 'bold'
let g:everforest_better_performance = 1
let g:everforest_transparent_background = 1
colorscheme everforest

let g:coc_global_extensions=['coc-git', 'coc-marketplace', 'coc-webpack', 'coc-tslint', 'coc-tabnine', 'coc-tslint-plugin', 'coc-simple-react-snippets', 'coc-snippets', 'coc-html', 'coc-rls', 'coc-pairs',  'coc-prettier', 'coc-json', 'coc-highlight', 'coc-emmet', 'coc-spell-checker', 'coc-tsserver', 'coc-word', 'coc-css', 'coc-smartf', 'coc-fzf-preview', 'coc-explorer', 'coc-rust-analyzer']

" "/*}*/
" shortcuts keys list/*{*/
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap F <Plug>(coc-smartf-backward)
xmap <silent><nowait> <space>x  <Plug>(coc-convert-snippet)
" Symbol renaming.
nmap ;rn <Plug>(coc-rename)
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" fzf preview keybinding
nnoremap <silent><nowait> <space>f :Files<cr>
nnoremap <silent><nowait> <space>b :Buffers<cr>
nnoremap <silent><nowait> <space>r :Rg<cr>
nnoremap <silent><nowait> <space>m :Marks<cr>
nnoremap <silent><nowait> <space>h :History<cr>
nnoremap <silent><nowait> <space>d :CocCommand fzf-preview.CocDiagnostics<cr>
nnoremap <silent><nowait> <space>s :CocCommand snippets.editSnippets<cr>
nnoremap <silent><nowait> <space>y  :<C-u>CocList -A --normal yank<cr>
nnoremap <silent><nowait> <space>e  :CocCommand explorer<CR>

" press <esc> to cancel.
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)

"/*}*/
"command functions list/*{*/

" coc neovim tab for selection and enter for select
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
augroup Smartf
autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#90f49c
autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end

autocmd BufWinEnter *.* hi CocExplorerNormalFloat guibg=default
autocmd BufWinLeave *.* hi CocExplorerNormalFloat guibg=default

augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END
"/*}*/
