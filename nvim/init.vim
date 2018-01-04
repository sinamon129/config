" dein Scripts-----------------------------
" Shougo/dein.vim

if &compatible
  set nocompatible
endif

let $CACHE = expand('~/.cache')
if !isdirectory(expand($CACHE))
  call mkdir(expand($CACHE), 'p')
endif

let s:dein_dir = expand('$CACHE/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml_dir = expand('~/.config/nvim')

  " 起動時に読み込み
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  " 遅延読み込み
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

" End dein Scripts-------------------------

set number
set expandtab
set tabstop=2
set autoindent
set shiftwidth=2

" ファイルを開く際に候補をリスト表示
set wildmode=list:longest

" settings for molokai
" tomasr/molokai
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" \cで行の先頭にコメントをつけたり外したり
" tyru/caw.vim.git
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

" 全角スペースをハイライト表示
" http://inari.hatenablog.com/entry/2014/05/05/231307
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

" rubocop
" ngmy/vim-rubocop
let g:vimrubocop_rubocop_cmd = 'bundle exec rubocop '
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

" RSpec
" thoughtbot/vim-rspec
let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "!bundle exec rspec -I . {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>

" deoplete
" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1

let g:python3_host_prog = 'path_to/neovim3/bin/python'
let g:python_host_prog = 'path_to/neovim2/bin/python'
