"" in ~/$ & ~/# run:
""
""  mkdir -p ~/.vim/tmp/; wget https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/.vimrc -P ~/
""
"" for NERDTree:
""
""  wget https://github.com/scrooloose/nerdtree/archive/master.zip; unzip master.zip -d ~/.vim/; mv ~/.vim/nerdtree-master/* ~/.vim/; rm -rf ~/.vim/nerdtree-master/
""

"" uncomment if you want NERDTree open on startup
"autocmd VimEnter * NERDTree
"autocmd BufEnter * NERDTreeMirror
"autocmd VimEnter * wincmd p

"" set default font size on gui
"set guifont=Monaco:h12

""set 2 spaces for tab globally
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab

set encoding=utf-8
set fileencoding=utf-8
set number
syntax on
set cursorline
set backupdir=~/.vim/tmp/
set directory=~/.vim/tmp/

