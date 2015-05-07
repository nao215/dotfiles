"--------------------------------------------------------------------------
"" neobundle
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

filetype plugin indent on     " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif

NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'Shougo/vimshell'
NeoBundle 'syui/airjulius'
NeoBundle 'supermomonga/shaberu.vim'
NeoBundle 'toyamarinyon/vim-swift'
NeoBundle 'gre/play2vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'othree/html5.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'groenewege/vim-less'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \   'windows' : 'make -f make_mingw32.mak',
  \   'cygwin' : 'make -f make_cygwin.mak',
  \   'mac' : 'make -f make_mac.mak',
  \   'unix' : 'make -f make_unix.mak',
  \ },
  \ }
""""""""""""""""""""""Maping""""""""""""""""""""""
map <C-l> gt
map <C-h> gT
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
noremap <silent> <C-p> "0p<CR>
noremap mc :'s,'ey<CR>
noremap md :'s,'ed<CR>
noremap wq :r! good bye!<CR>,wq<CR>
noremap <C-t> :tabnew_cdl<CR>
noremap <C-n> :let g:vimfiler_edit_action = 'open'<CR>
"""""""""""""""""""""""coffee"""""""""""""""""""""
autocmd BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデント設定
autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et
" オートコンパイル
  "保存と同時にコンパイルする
autocmd BufWritePost *.coffee silent make! 
  "エラーがあったら別ウィンドウで表示
autocmd QuickFixCmdPost * nested cwindow | redraw! 
" Ctrl-cで右ウィンドウにコンパイル結果を一時表示する
nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h
"""""""""""""""""""""""config"""""""""""""""""""""""
set clipboard=unnamed,autoselect
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set cursorline
set number
set laststatus=2
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set noswapfile
let g:Powerline_symbols = 'fancy'
set t_Co=256
let g:Powerline_symbols = 'compatible'
set mouse=a
set noshowmode
set guifont=Ricty\ Discord:h12
set guifontwide=Ricty\ Discord:h12
set tabstop=2
"set fileencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
set nowrap
let g:netrw_liststyle = 3
let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
let g:netrw_altv = 1
let g:netrw_alto = 1
let g:Powerline_colorscheme='my'
let complcache_enable_at_startup = 1
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default=0
let g:netrw_liststyle=3
autocmd VimEnter * VimFiler -split -simple -winwidth=30 -no-quit
autocmd BufRead,BufNewFile * VimFiler -split -simple -winwidth=30 -no-quit

"dist
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : ''
  \ }

set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap " . k . " " . k . "<C-N><C-P>"
endfor

imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"
filetype plugin indent on     " required!
filetype indent on
syntax on
colorscheme darkblue

""""""""""jarvim""""""""""
""call vimproc#system_bg('say welcome to vim')
""noremap ms ms:call vimproc#system_bg('say mark start')<CR> 
""noremap me me:call vimproc#system_bg('say mark end')<CR> 
""noremap v :call vimproc#system_bg('say visual mode')<CR>v
""noremap :wq :call vimproc#system_bg('say good bye ')<CR>:wq<CR>
""noremap :q :call vimproc#system_bg('say good bye ')<CR>:q<CR>
""noremap / :call vimproc#system_bg('say serch')<CR>/
""noremap ? :call vimproc#system_bg('say serch')<CR>?
""noremap <C-W><C-W> :call vimproc#system_bg('say change window')<CR><C-W><C-W> 
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
""""""""""""""""""""""indentLine""""""""""""""""""""""""
let g:indentLine_faster = 1
nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
