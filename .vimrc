set nocompatible
filetype off

" vim自身の文字コード
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" github にあるプラグイン
Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/neosnippet'
Plugin 'mattn/emmet-vim'
Plugin 'joonty/vdebug'
Plugin 'Yggdroot/indentLine'
Plugin 'tomtom/tcomment_vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'junegunn/vim-easy-align'
Plugin 'tyru/caw.vim.git'
Plugin 'thoughtbot/vim-rspec'
Plugin 'alpaca-tc/alpaca_powertabline'
Plugin 'Lokaltog/powerline.git'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'ngmy/vim-rubocop'
Plugin 'slim-template/vim-slim.git'
Plugin 'jiangmiao/simple-javascript-indenter'
Plugin 'Shougo/unite.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'othree/yajs.vim'

call vundle#end()
" vim-scripts プラグイン

" github にないプラグイン

" ファイル形式検出、プラグイン、インデントを ON
filetype plugin indent on
set expandtab
set tabstop=2
set autoindent
set shiftwidth=2
syntax on
set t_Co=256
colorscheme molokai

let g:neocomplcache_enable_at_startup = 1
set number

" ファイルを開く際に、候補をリストで表示するようにする
set wildmode=list:longest

" vim立ち上げ時にvim-indent-guidesをonにする
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

""""""""""""""""""""""""""""""
" 全角スペースの表示 http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

" vim-easy-alignの設定
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" \cで行の先頭にコメントをつけたり外したりできる
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

" rubocop
let g:vimrubocop_rubocop_cmd = 'bundle exec rubocop '
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

" RSpec.vim mappings
let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "!bundle exec rspec -I . {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>

" jbuilder
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

" coffee
au BufRead,BufNewFile,BufReadPre *.js.coffee   set filetype=coffee
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
autocmd BufRead,BufNewFile *.js setfiletype javascript
