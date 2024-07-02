set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'xolox/vim-misc'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'mattn/emmet-vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'wellle/tmux-complete.vim'
Plugin 'embear/vim-localvimrc'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'morhetz/gruvbox'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'ervandew/supertab'
Plugin 'catppuccin/vim'
call vundle#end()

filetype plugin indent on

set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set history=50		" keep 50 lines of command line history
autocmd FileType make setlocal noexpandtab
autocmd FileType python setlocal noexpandtab

set showmatch
set mouse=a

" Tell vim to remember certain things when we exit
"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
"  :20 : up to 20 lines of command-line history will be remembered
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

set backspace=indent,eol,start

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#tabline#enabled = 1

hi clear SignColumn
let g:airline#extensions#hunks#non_zero_only = 1
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>
let g:airline#extensions#whitespace#checks = [ ]

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.pyc,*.m     " MacOSX/Linux

syntax enable
" You might have to force true color when using regular vim inside tmux as the
" colorscheme can appear to be grayscale with "termguicolors" option enabled.
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set termguicolors
set background=dark

let g:gitgutter_sign_column_always = 1
autocmd FileType c,cpp,objc,meld RainbowParenthesesToggle
" Switch from block-cursor to vertical-line-cursor when going into/out of
" insert mode
if exists('$TMUX')
   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
   autocmd BufEnter, BufReadPost,FileReadPost,BufNewFile * let &titlestring = ' ' . expand("%:t")
   set title
endif

set showmode
set cursorline
set number

hi Normal ctermbg=none
nnoremap <silent> <C-p> :FZF<CR>
autocmd BufLeave,BufWinLeave * silent! mkview
autocmd filetype c,cpp,h,hpp silent! :Sleuth
autocmd BufReadPost * silent! loadview
colorscheme catppuccin_mocha
