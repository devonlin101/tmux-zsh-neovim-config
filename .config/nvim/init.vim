"vim plug plugin ######/*{*/
call plug#begin('~/.vim/plugged') 
  "Plug 'rakr/vim-one'
  "Plug 'tpope/vim-fugitive'
 "Plug 'ayu-theme/ayu-vim' " or other package manager
  "Plug 'vim-airline/vim-airline-themes'
  "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
  "Plug 'edkolev/tmuxline.vim'
  "Plug 'vim-airline/vim-airline'
  Plug 'ryanoasis/vim-devicons'
  Plug 'sainnhe/everforest'
  Plug 'sheerun/vim-polyglot'
  Plug 'Yggdroot/indentLine'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf.vim' " needed for previews
  Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf','do': './install --all'}
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()
"/*}*/
"set configurations /*{*/ 
set encoding=utf-8
set termguicolors     " enable true colors support
set t_Co=256
set title
set hidden
set nobackup
set nowritebackup
set cursorline
set smartcase
set linebreak
set ignorecase
set relativenumber
set mouse=a
set history=200
set shortmess+=c
set updatetime=300
set foldmethod=marker
set foldmarker=/*{*/,/*}*/
set foldcolumn=1
set foldlevelstart=99
set showtabline=2
set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70
"set spell spelllang=en
set timeoutlen=1000 ttimeoutlen=0
set tabstop=3 softtabstop=2 shiftwidth=2 expandtab
"set laststatus=0
set noshowmode
set shortmess+=c
set splitbelow splitright
set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
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
"let g:indentLine_char = ''
"let g:indentLine_first_char = ''
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = -1
" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
"lightline configurations
     let g:lightline = {
           \'colorscheme':'everforest',
		\ 'component': {
		\   'lineinfo': ' %3l:%-2v',
		\ },
		\ 'component_function' : {
      \ 'filetype' : 'MyFiletype',
      \ 'fileformat' : 'MyFileformat',
      \ 'blame' : 'LightlineGitBlame',
		\ },
      \ 'active' : {
        \ 'left' : [ [ 'mode', 'paste' ],
		    \           [ 'git', 'diagnostic', 'cocstatus', 'readonly', 'filename', 'method', 'modified' ] ],
		    \ 'right' : [ [ 'lineinfo' ], [ 'percent', ],[ 'filetype' ], [ 'blame' ] ],
         \ },
		\ 'separator': { 'left': '', 'right': '' },
		\ 'subseparator': { 'left': '', 'right': '' },
      \ 'tabline' : {
   		    \ 'left': [ [ 'tabs', 'filetype' ] ],
		    \ 'right': [ [ 'close' ] ]       
         \ }
		\ } 
    function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  endfunction
  
  function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
  endfunction
  function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

"tmuxline setup
 "" let g:tmuxline_preset = {
 ""       \'a'    : '#S',
 ""       \'b'    : '%R',
 ""       \'c'    : [ '#{sysstat_mem} #[fg=blue]#{sysstat_ntemp} #[fg=green]\ufa51#{upload_speed}' ],
 ""       \'win'  : [ '#I', '#W' ],
 ""       \'cwin' : [ '#I', '#W', '#F' ],
 ""       \'x'    : [ "#[fg=green]#{download_speed} \uf6d9 #[fg=blue]#{sysstat_itemp} #{sysstat_cpu}" ],
 ""       \'y'    : [ '%a' ],
 ""       \'z'    : '#H #{prefix_highlight}'
 ""       \}
"let g:airline#extension#tmuxline#enabled = 1
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#whitespace#enabled = 0
"let g:everforest_diagnostic_text_highlight = 1
"let g:everforest_diagnostic_line_highlight = 1
"let g:everforest_diagnostic_virtual_text = 'colored'
let g:everforest_background = 'soft' " 'hard', 'medium', 'soft' 
let g:everforest_enable_italic = 1
let g:everforest_better_performance = 1
let g:everforest_current_word = 'bold'
"let ayucolor = 'mirage'
colorscheme everforest

let g:coc_global_extensions=['coc-marketplace', 'coc-webpack', 'coc-tslint', 'coc-tabnine', 'coc-tslint-plugin', 'coc-simple-react-snippets', 'coc-snippets', 'coc-html', 'coc-rls', 'coc-pairs',  'coc-prettier', 'coc-json', 'coc-highlight', 'coc-emmet', 'coc-spell-checker', 'coc-tsserver', 'coc-word', 'coc-css', 'coc-smartf', 'coc-fzf-preview', 'coc-explorer', 'coc-rust-analyzer']

" "/*}*/
" coc neovim / fzf-preview / coc snippets setup configurations/*{*/
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

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

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

" Symbol renaming.
nmap <space>rn <Plug>(coc-rename)


" fzf preview keybinding
nnoremap <silent> <space>f :Files<cr>
nnoremap <silent> <space>b :Buffers<cr>
nnoremap <silent> <space>r :Rg<cr>

" press <esc> to cancel.
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
augroup Smartf
autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#90f49c
autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end
"augroup TabColors
"  autocmd ColorScheme :hi TabLineSel guifg=LightGreen guibg=NONE
"augroup END
augroup mygroup
autocmd!
" Setup formatexpr specified filetype(s).
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder.
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Symbol renaming.
nmap <space>rn <Plug>(coc-rename)
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :CocCommand explorer<CR>
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"auto save vim folds
" Save and restore manual folds when we exit a file
augroup savefolds
  autocmd!
au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview
augroup end
"/*}*/s/*}*/
