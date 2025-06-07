set undofile
set bg=dark
set belloff=all
set hlsearch
set ignorecase
set foldmethod=indent
set number
set relativenumber
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
set statusline+=%F
set hidden
set timeoutlen=500
set updatetime=300
set shortmess+=c
set signcolumn=yes
set termguicolors
set clipboard=unnamedplus
set noswapfile
set term=kitty
set t_RV=

function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

command! -nargs=0 Format :call CocAction('format')

command! -nargs=? Fold :call CocAction('fold', <f-args>)

command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

autocmd BufRead * call SyncTree()

autocmd CursorHold * silent call CocActionAsync('highlight')

highlight Normal ctermbg=None

let mapleader = ","
let g:mapleader = ","

let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exculed-standard']

nmap <C-n> :NERDTreeToggle<CR>
nmap <Leader>n :NERDTreeFocus<CR>

nmap <C-t> :TagbarToggle<CR>

nmap ++ <Plug>NERDCommenterToggle
vmap ++ <Plug>NERDCommenterToggle

nmap <M-k> :m-2<CR>
nmap <M-j> :m+1<CR>

vnoremap K :m '<-2<CR>gv=gv
xnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
xnoremap J :m '>+1<CR>gv=gv

vnoremap > >gv
vnoremap < <gv

nnoremap gb :ls<CR>:b<Space>
nnoremap ge yiw:%s/<C-r>0//g<Left><Left>
nnoremap <Leader>r @:

noremap <Leader>y "+y
noremap <Leader>p "+p
vmap <Leader>y "+y
vmap <Leader>p "+p

nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap <Leader>d ""d
nnoremap <Leader>D ""D
vnoremap <Leader>d ""d

inoremap <C-BS> <C-w>

nnoremap = <C-w>>
nnoremap - <C-w><
nnoremap <Leader>w= :vertical resize +5<CR>
nnoremap <Leader>w- :vertical resize -5<CR>

nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

inoremap <silent><expr> <C-Space> coc#refresh()

inoremap <expr> <CR> pumvisisble() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <Space>r <Plug>(coc-rename)

xmap <Leader>f <Plug>(coc-format-selected)
nmap <Leader>f <Plug>(coc-format-selected)

xmap <Leader>a <Plug>(coc-codeaction-selected)
nmap <Leader>a <Plug>(coc-codeaction-selected)

nmap <Leader>ac <Plug>(coc-codeaction)
nmap <Leader>qf <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

xmap <silent> <C-d> <Plug>(coc-range-select)
nmap <silent> <C-d> <Plug>(coc-range-select)

nnoremap <silent> <Space>a :<C-u>CocList diagnostics<CR>
nnoremap <silent> <Space>e :<C-u>CocList extensions<CR>
nnoremap <silent> <Space>c :<C-u>CocList commands<CR>
nnoremap <silent> <Space>o :<C-u>CocList outline<CR>
nnoremap <silent> <Space>s :<C-u>CocList -I symbols<CR>
nnoremap <silent> <Space>j :<C-u>CocNext<CR>
nnoremap <silent> <Space>k :<C-u>CocPrev<CR>
nnoremap <silent> <Space>p :<C-u>CocListResume<CR>
