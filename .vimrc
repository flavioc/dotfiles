
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'DamienCassou/textlint'
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'benmills/vimux'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/twilight256.vim'
Plugin 'endel/vim-github-colorscheme'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-clang-format'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-endwise'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'vim-latex/vim-latex'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-surround'
"Plugin 'Raimondi/delimitMate'
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'jeetsukumaran/vim-indentwise'
Plugin 'mattn/emmet-vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'junegunn/seoul256.vim'
Plugin 'justinmk/vim-sneak'
Plugin 'chriskempson/tomorrow-theme'
Plugin 'wellle/tmux-complete.vim'
Plugin 'embear/vim-localvimrc'
Plugin 'ciaranm/detectindent'
call vundle#end()

filetype plugin indent on

set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set history=50		" keep 50 lines of command line history
set expandtab
autocmd FileType make setlocal noexpandtab
autocmd FileType python setlocal noexpandtab

" au BufRead,BufNewFile *.lagda setfiletype agda
" autocmd FileType agda setlocal noexpandtab

set showmatch
set tabstop=3
set shiftwidth=3
set cindent
set smartindent
set mouse=a

" Tell vim to remember certain things when we exit
"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
"  :20 : up to 20 lines of command-line history will be remembered
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
au!
autocmd BufReadPost *
\ if expand("<afile>:p:h") !=? $TEMP |
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\ let JumpCursorOnEdit_foo = line("'\"") |
\ let b:doopenfold = 1 |
\ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
\ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
\ let b:doopenfold = 2 |
\ endif |
\ exe JumpCursorOnEdit_foo |
\ endif |
\ endif
" Need to postpone using "zv" until after reading the modelines.
autocmd BufWinEnter *
\ if exists("b:doopenfold") |
\ exe "normal zv" |
\ if(b:doopenfold > 1) |
\ exe "+".1 |
\ endif |
\ unlet b:doopenfold |
\ endif
augroup END

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
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

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
let g:ctrlp_extensions = ['tag']

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.pyc,*.m     " MacOSX/Linux

let g:ctrlp_custom_ignore = {
  \ 'dir':  '[\/]\.(git|hg|svn)$\|tests$\|benchs$',
  \ 'file': '\.(exe|so|dll|o)$\|tags$',
  \ 'link': 'some_bad_symbolic_links'}

:nnoremap <c-t> :CtrlPTag<CR>
:nnoremap <c-b> :CtrlPBuffer<CR>
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme seoul256
"colorscheme Tomorrow-Night-Blue
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:clang_format#code_style = "google"
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
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
autocmd VimEnter * DetectIndent
