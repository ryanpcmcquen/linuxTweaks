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

set encoding=utf-8
set fileencoding=utf-8
set number

syntax off

set nobackup
set nowritebackup
set noswapfile

"" have gvim use X11 clipboard
set clipboard=unnamedplus
set mouse=a

set smartcase

