 """""""""""""""""""""""Dein"""""""""""""""""""""""
if &compatible
  set nocompatible
endif

set runtimepath^=~/.homesick/repos/dotfiles/home/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.cache/dein'))

" Dark powered vim plugin manager
call dein#add('Shougo/dein.vim')

" For JSX
call dein#add('mxw/vim-jsx')

" Syntastic
call dein#add('pmsorhaindo/syntastic-local-eslint.vim')
call dein#add('scrooloose/syntastic')

" For JS Syntax
call dein#add('pangloss/vim-javascript')

" Ctrl + p make me smart file search
call dein#add('ctrlpvim/ctrlp.vim')

" CSS Fixer http://csscomb.com/
call dein#add('csscomb/vim-csscomb')

" easy motion(cursor movement)
call dein#add('easymotion/vim-easymotion')

let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-s2)

" editorconfig
call dein#add('editorconfig/editorconfig-vim')

call dein#add('markstory/vim-files.git')
call dein#add('evidens/vim-twig')
call dein#add('haya14busa/vim-migemo')
call dein#add('haya14busa/incsearch.vim')
call dein#add('plasticboy/vim-markdown')
call dein#add('kannokanno/previm')
call dein#add('tyru/open-browser.vim')
call dein#add('kchmck/vim-coffee-script')
call dein#add('othree/yajs.vim', {'autoload':{'filetypes':['javascript']}})
call dein#add('stephpy/vim-yaml')
call dein#add('toyamarinyon/vim-swift')
call dein#add('gre/play2vim')
call dein#add('alpaca-tc/alpaca_powertabline')
call dein#add('othree/html5.vim')
call dein#add('Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'})
call dein#add('groenewege/vim-less')
call dein#add('Yggdroot/indentLine')
call dein#add('vim-ruby/vim-ruby')
call dein#add('slim-template/vim-slim')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-haml')
call dein#add('tpope/vim-rails')
call dein#add('Shougo/vimfiler.vim')
call dein#add('Shougo/neocomplcache')
call dein#add('Shougo/vimshell')
call dein#add('Shougo/unite.vim')

call dein#end()

filetype plugin indent on
syntax on
""""""""""""""""""""""Mapping""""""""""""""""""""""
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map <C-l> gt
map <C-h> gT
map <C-c> :CSScomb<CR>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
noremap <C-a> ^
noremap <C-g> :vimgrep
noremap <C-e> $
noremap <C-k> d$
noremap <silent> <C-p> "0p<CR>
noremap mc :'s,'ey<CR>
noremap md :'s,'ed<CR>
noremap wq :r! good bye!<CR>,wq<CR>
noremap <C-t> :tabnew_cdl<CR>
noremap <C-n> :let g:vimfiler_edit_action = 'open'<CR>
"""""""""""""""""""""""autocmd"""""""""""""""""""""
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
autocmd BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType css noremap <buffer> <leader>bc :CSScomb<CR>
autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et
autocmd QuickFixCmdPost * nested cwindow | redraw! 
autocmd BufNewFile,BufRead *.slim set ft=slim
autocmd VimEnter,BufRead,BufNewFile *.twig set ft=html
autocmd VimEnter,BufRead,BufNewFile *.html.twig set ft=html
autocmd VimEnter * VimFiler -split -simple -winwidth=30 -no-quit
autocmd BufNewFile * VimFiler -split -simple -winwidth=30 -no-quit
"""""""""""""""""""""""config"""""""""""""""""""""""
set clipboard=unnamed,autoselect
set noexpandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set cursorline
set number
set laststatus=2
set rtp+=.vim/bundle/powerline/powerline/bindings/vim
set noswapfile
set t_Co=256
set mouse=a
set noshowmode
set guifont=Ricty\ Discord:h12
set guifontwide=Ricty\ Discord:h12
set tabstop=2
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
set nowrap
set foldcolumn=4
set foldmethod=indent
set foldlevel=100

let g:vim_markdown_folding_disabled=1
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['ruby', 'javascript'],
                           \ 'passive_filetypes': [] }
let g:Powerline_symbols = 'compatible'
let g:netrw_liststyle = 3
let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
let g:netrw_altv = 1
let g:netrw_alto = 1
let g:Powerline_colorscheme='my'
let complcache_enable_at_startup = 1
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default=0
let g:netrw_liststyle=3
let g:syntastic_scss_checkers=['stylelint']
let g:syntastic_javascript_checkers=['eslint']

"ctrlp
let g:ctrlp_custom_ignore = '\v[\/](public|vender|storage|node_modules|target|dist)|(\.(swp|ico|git|svn))$'
set wildignore+=*/node_modules/*,*/gulp/temp/*,*.so,*.swp,*.zip

"dist
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : ''
  \ }

set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap " . k . " " . k . "<C-N><C-P>"
endfor

imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"
colorscheme darkblue

"""""""""""""""""""""for swift"""""""""""""""""""""
au BufRead,BufNewFile *.swift setfiletype swift
au FileType swift call FileType_Swift()

function! FileType_Swift()
    if exists("b:did_ftswift") | return | endif
    let b:did_ftswift = 1

    nnoremap <buffer> <Leader>sw :Shell xcrun swift -i %
endfunction
"""""""""""""""""""""""""tab""""""""""""""""""""""""""
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
map <silent> [Tag]n :tabnext<CR>   

" For Edit Vimrc
command! Rv source ~/.vimrc
command! Ev edit ~/.vimrc
