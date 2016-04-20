"""""""""""""""""""""""Dein"""""""""""""""""""""""
if &compatible
  set nocompatible
endif
set runtimepath^=~/.homesick/repos/dotfiles/home/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.cache/dein'))

call dein#add('~/.homesick/repos/dotfiles/home/repos/github.com/Shougo/dein.vim')
call dein#add('othree/yajs.vim')
call dein#add('kchmck/vim-coffee-script')
call dein#add('kchmck/vim-coffee-script')
call dein#add('othree/yajs.vim', {'autoload':{'filetypes':['javascript']}})
call dein#add('kchmck/vim-coffee-script')
call dein#add('supermomonga/shaberu.vim')
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

filetype plugin indent on
syntax on
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
nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h
"""""""""""""""""""""""autocmd"""""""""""""""""""""
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
autocmd BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et
autocmd QuickFixCmdPost * nested cwindow | redraw! 
autocmd BufNewFile,BufRead *.slim set ft=slim
"""""""""""""""""""""""config"""""""""""""""""""""""
set clipboard=unnamed,autoselect
set expandtab
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
"set fileencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
set nowrap
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
autocmd VimEnter * VimFiler -split -simple -winwidth=40 -no-quit
autocmd BufRead,BufNewFile * VimFiler -split -simple -winwidth=40 -no-quit

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

