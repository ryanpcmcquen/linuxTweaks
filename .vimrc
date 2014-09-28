
set nocompatible

""
"" in ~/$ & ~/# run:
""
""  wget -N https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/.vimrc -P ~/
""

"" set default font size on gui
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Monospace\ 11
  elseif has("gui_photon")
    set guifont=Monospace:s11
  elseif has("gui_kde")
    set guifont=Monospace/11/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  elseif has("gui_macvim")
    set guifont=Monaco:h12
  else
    set guifont=Monospace:h11:cDEFAULT
  endif
  set lines=40 columns=135
endif

"" set 2 spaces for tab globally
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab

set autoindent
filetype plugin indent on

set encoding=utf-8
set fileencoding=utf-8
set number
set wrap

"" almost like no syntax highlighting
syntax on
colorscheme elvis

set nobackup
set nowritebackup
set noswapfile

set mouse=a

set ignorecase smartcase
set incsearch
set hlsearch

set title
set ruler
set wildmenu
set wildmode=list:longest,full

"" syntax toggler
nnoremap <F7> :syntax off<CR>
vnoremap <F7> :syntax off<CR>
nnoremap <F8> :syntax on<CR>
vnoremap <F8> :syntax on<CR>

set paste
set pastetoggle=<F2>
set showmode

"" unsets "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

set showmatch

"" nifty shortcut for middle of line
"" instead of middle of screen
map gm :call cursor(0, virtcol('$')/2)<CR>

"" save as sudo if you are being forgetful
cmap w!! %!sudo tee > /dev/null %

if &term =~ '256color'
  "" render properly when in 256-color tmux
  set t_ut=
endif

