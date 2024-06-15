
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'DamienCassou/textlint'
Plugin 'gmarik/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'benmills/vimux'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/twilight256.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'kana/vim-operator-user'
Plugin 'vim-latex/vim-latex'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'mattn/emmet-vim'
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'junegunn/seoul256.vim'
Plugin 'justinmk/vim-sneak'
Plugin 'chriskempson/tomorrow-theme'
Plugin 'wellle/tmux-complete.vim'
Plugin 'embear/vim-localvimrc'
Bundle 'roryokane/detectindent'
Plugin 'junegunn/fzf'
Plugin 'miconda/lucariox.vim'
Plugin 'morhetz/gruvbox'
Plugin 'NLKNguyen/papercolor-theme'
call vundle#end()

filetype plugin indent on

set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set history=50		" keep 50 lines of command line history
autocmd FileType make setlocal noexpandtab
autocmd FileType python setlocal noexpandtab

" au BufRead,BufNewFile *.lagda setfiletype agda
" autocmd FileType agda setlocal noexpandtab

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
set showmode
au BufNewFile,BufRead *.gi set filetype=haskell
au BufNewFile,BufRead *.go set filetype=go

set backspace=indent,eol,start
au Filetype python setl et ts=3 sw=3

let g:tex_flavor='latex'
set cinoptions=+0
au FileType tex set tw=80

"set guifont=Menlo\ for\ Powerline

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
" let g:nerdtree_tabs_open_on_console_startup = 0

set tags=./tags;,~/.vimtags

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
"
nmap <silent> <leader>b :TagbarToggle<CR><c-w>l

" Uncomment to open tagbar automatically whenever possible
" autocmd BufEnter * nested :call tagbar#autoopen(0)
hi clear SignColumn
let g:airline#extensions#hunks#non_zero_only = 1
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>
let g:airline#extensions#whitespace#checks = [ ]
"let g:ctrlp_extensions = ['tag']

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.pyc,*.m     " MacOSX/Linux

":nnoremap <c-t> :CtrlPTag<CR>
":nnoremap <c-b> :CtrlPBuffer<CR>
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
syntax enable
set background=dark
"colorscheme Tomorrow-Night-Blue
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" if you install vim-operator-user
set completeopt=menu,menuone,longest

let g:gitgutter_sign_column_always = 1
" for easymotion
" nmap s <Plug>(easymotion-s)
au FileType tex set spell spelllang=en_us
autocmd FileType c,cpp,objc,meld RainbowParenthesesToggle
" Switch from block-cursor to vertical-line-cursor when going into/out of
" insert mode
if exists('$TMUX')
   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
   autocmd BufEnter, BufReadPost,FileReadPost,BufNewFile * let &titlestring = ' ' . expand("%:t")
   set title
endif
"set ambiwidth=double
let g:tmuxcomplete#trigger = 'omnifunc'

function! SetupEnvironment()
  let l:path = expand('%:p')
  if l:path =~ '/Users/flaviocruz/Projects/hurd'
    setlocal noexpandtab smarttab sw=2 ts=2
  elseif l:path =~ '/home/user/projects'
  endif
endfunction
autocmd! BufReadPost,BufNewFile * call SetupEnvironment()

let g:localvimrc_ask = 0
hi Normal ctermbg=none
nnoremap <silent> <C-p> :FZF<CR>
autocmd BufLeave,BufWinLeave * silent! mkview
autocmd filetype c,cpp,h,hpp silent! :Sleuth
autocmd BufReadPost * silent! loadview
colorscheme PaperColor
