let g:python_host_prog = '/Users/nao/.anyenv/envs/pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/nao/.anyenv/envs/pyenv/versions/neovim3/bin/python'

" Dein Settings
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.cache/dein'))

" Dark powered vim plugin manager
call dein#add('Shougo/dein.vim')


" Grep
call dein#add('mileszs/ack.vim')

let g:ackprg = 'rg --vimgrep --no-heading'

if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Git
call dein#add('tpope/vim-fugitive')
call dein#add('gregsexton/gitv')
call dein#add('airblade/vim-gitgutter')

autocmd FileType gitv call s:my_gitv_settings()
autocmd FileType git setlocal nofoldenable foldlevel=0
autocmd FileType git :setlocal foldlevel=99

function! s:toggle_git_folding()
  if &filetype ==# 'git'
    setlocal foldenable!
  endif
endfunction

function! s:my_gitv_settings()
    setlocal iskeyword+=/,-,.
    nnoremap <silent><buffer> C :<C-u>Git checkout <C-r><C-w><CR>
    nnoremap <buffer> <Space>rb :<C-u>Git rebase <C-r>=GitvGetCurrentHash()<CR><Space>
    nnoremap <buffer> <Space>R :<C-u>Git revert <C-r>=GitvGetCurrentHash()<CR><CR>
    nnoremap <buffer> <Space>h :<C-u>Git cherry-pick <C-r>=GitvGetCurrentHash()<CR><CR>
    nnoremap <buffer> <Space>rh :<C-u>Git reset --hard <C-r>=GitvGetCurrentHash()<CR>
endfunction

function! s:gitv_get_current_hash()
  return matchstr(getline('.'), '\[\zs.\{7\}\ze\]$')
endfunction

" For python
call dein#add('lambdalisue/vim-pyenv')

if filereadable('~/.pyenv/shims/python')
    let $PYTHON_DLL = '~/.pyenv/shims/python'
endif

function! s:set_python_path()
    let s:python_path = system('python3 -', 'import sys;sys.stdout.write(",".join(sys.path))')

    python3 <<EOT
import sys
import vim

python_paths = vim.eval('s:python_path').split(',')
for path in python_paths:
    if not path in sys.path:
        sys.path.insert(0, path)
EOT
endfunction

" Status bar
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

" Neomake
call dein#add('neomake/neomake')
function! NeomakeESlintChecker()
  let l:npm_bin = ''
  let l:eslint = 'eslint'

  if executable('npm')
    let l:npm_bin = split(system('npm bin'), '\n')[0]
  endif

  if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
    let l:eslint = l:npm_bin . '/eslint'
  endif

  let b:neomake_javascript_eslint_exe = l:eslint
endfunction
autocmd FileType javascript :call NeomakeESlintChecker()

autocmd! BufWritePost,BufReadPost * Neomake

" For JS
call dein#add('pangloss/vim-javascript')
call dein#add('Shougo/vimproc.vim', { 'build' : 'make -f make_mac.mak' })
call dein#add('Quramy/tsuquyomi')
call dein#add('prettier/vim-prettier')
call dein#add('mxw/vim-jsx')

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Ctrl + p make vim smart file search
call dein#add('ctrlpvim/ctrlp.vim')
let g:ctrlp_custom_ignore = '\v[\/](public|vender|storage|node_modules|target|dist)|(\.(swp|ico|git|svn))$'
set wildignore+=*/node_modules/*,*/gulp/temp/*,*.so,*.swp,*.zip

" CSS Fixer
call dein#add('kewah/vim-stylefmt')
autocmd FileType css noremap <buffer> <leader>bc :Stylefmt<CR>

" easy motion(cursor movement)
call dein#add('easymotion/vim-easymotion')

let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-s2)

" editorconfig
call dein#add('editorconfig/editorconfig-vim')

" filer
call dein#add('Shougo/vimfiler.vim')
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default=0
autocmd VimEnter * VimFiler -split -simple -winwidth=30 -no-quit
autocmd BufNewFile * VimFiler -split -simple -winwidth=30 -no-quit
noremap <C-n> :let g:vimfiler_edit_action = 'open'<CR>

" neocomplcache
call dein#add('Shougo/neocomplcache')
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : ''
  \ }

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
call dein#add('othree/html5.vim')
call dein#add('groenewege/vim-less')
call dein#add('Yggdroot/indentLine')
call dein#add('vim-ruby/vim-ruby')
call dein#add('slim-template/vim-slim')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-haml')
call dein#add('tpope/vim-rails')
call dein#add('Shougo/vimshell')
call dein#add('Shougo/unite.vim')
call dein#add('alpaca-tc/alpaca_powertabline')
call dein#add('ap/vim-buftabline')

call dein#end()

filetype plugin indent on
syntax on
""""""""""""""""""""""Mapping""""""""""""""""""""""
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map <C-l> gt
map <C-h> gT
map <C-c> :Stylefmt<CR>
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
noremap <C-g> :Ack
noremap <C-e> $
noremap <C-k> d$
noremap <silent> <C-p> "0p<CR>
noremap mc :'s,'ey<CR>
noremap md :'s,'ed<CR>
noremap wq :r! good bye!<CR>,wq<CR>
noremap <C-t> :tabnew_cdl<CR>
"""""""""""""""""""""""autocmd"""""""""""""""""""""
autocmd BufRead,BufWritePost * Neomake
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
autocmd BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et
autocmd QuickFixCmdPost * nested cwindow | redraw!
autocmd BufNewFile,BufRead *.slim set ft=slim
autocmd VimEnter,BufRead,BufNewFile *.twig set ft=html
autocmd VimEnter,BufRead,BufNewFile *.html.twig set ft=html
"""""""""""""""""""""""config"""""""""""""""""""""""
" paste
execute "set <f28>=\<Esc>[200~"
execute "set <f29>=\<Esc>[201~"
cmap <f28> <nop>
cmap <f29> <nop>
set clipboard=unnamed

set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set cursorline
set number
set laststatus=2
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
set backspace=indent,eol,start

let g:vim_markdown_folding_disabled=1
let g:netrw_liststyle = 3
let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
let g:netrw_altv = 1
let g:netrw_alto = 1
let complcache_enable_at_startup = 1
let g:netrw_liststyle=3

set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap " . k . " " . k . "<C-N><C-P>"
endfor

imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"
colorscheme darkblue
