--[[ keys.lua ]]
local map = vim.keymap.set

--fzf find files
vim.api.nvim_set_keymap('n', '<space>f',
    "<cmd>lua require('fzf-lua').files()<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>o',
    "<cmd>lua require('fzf-lua').oldfiles()<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>b',
    "<cmd>lua require('fzf-lua').buffers()<CR>",
    { noremap = true, silent = true })

map('n','<space>q','<cmd>bd<cr>',{})
map('n','gd','<Plug>(coc-definition)',{silent=true})
map('n','<space>e','<cmd>CocCommand explorer<cr>',{silent=true })

vim.cmd [[
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction 
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <silent> K :call <SID>show_documentation()<CR>
xmap <silent><nowait> <space>x  <Plug>(coc-convert-snippet)
nnoremap <silent><nowait> <space>s :CocCommand snippets.editSnippets<cr>
nmap ;rn <Plug>(coc-rename)
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
augroup Smartf
autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#90f49c
autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end
]]
