
set nocompatible

""
"" in '$ ~/' & '# ~/' run:
""
""  wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.vimrc -P ~/
""

"" set default font size on gui
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Monospace\ 10
  elseif has("gui_photon")
    set guifont=Monospace:s10
  elseif has("gui_kde")
    set guifont=Monospace/10/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Monospace:h10:cDEFAULT
  endif
  set lines=40 columns=130
endif

"" set 2 spaces for tab globally, 
"" make indenting sane
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set autoindent
filetype plugin indent on

"" utf-8!
set encoding=utf-8
set fileencoding=utf-8
set number
set wrap

"" almost like no syntax highlighting
if filereadable(expand("$HOME/.vim/colors/vi-clone.vim"))
  syntax on
  colorscheme vi-clone
else
  syntax off
endif


"" clear out the cruft
set nobackup
set nowritebackup
set noswapfile
set noundofile

"" make searching easy, and case insensitive
set ignorecase smartcase
set incsearch
set hlsearch

"" gives you a little jazzy info on the bottom
set title
set ruler

"" turn on the wildmenu, get wild!
set wildmenu

"" syntax toggler
nnoremap <F7> :syntax off<CR>
vnoremap <F7> :syntax off<CR>
nnoremap <F8> :syntax on<CR>
vnoremap <F8> :syntax on<CR>

"" make pasting not ruin indentation, 
"" and show the mode so you know it is on
set paste
set showmode

"" unsets "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

"" nifty shortcut for middle of line
"" instead of middle of screen
map gm :call cursor(0, virtcol('$')/2)<CR>

if &term =~ '256color'
  "" render properly when in 256-color tmux
  set t_ut=
endif

"" display filename in vim
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}


"""""""""""""""""""""""""""""""""""""""""""
"" all of the below is thanks to B. Watson  ;^)
"""""""""""""""""""""""""""""""""""""""""""
" Map to F1, because I hate "F1=Help" (I like my hotkeys to be something
" I'll use every day, and at this point in my Vim career, I don't need
" to look at the help every day...)
nmap <F1> :call ToggleComment()<CR>
" In insert mode, too:
inoremap <F1> :call ToggleComment()<CR>

" Visual mode: comment out the selected  block. Will fail if the block
" already contains /* */ comments (but // comments are OK).
vmap <F1> :'< mzO/*:'> myo*/`z

"" Highlight an entire block of code, from anywhere within it.
"" Leaves me in Visual mode, with the cursor at the closing brace.
nmap <F2> [{V]}

" Visual mode: converts a block of comments like this:

" // This is a
" // multi-line
" // comment

" into this:

" /* This is a
"	multi-line
"	comment
" */

" TODO: block_comment.pl is missing...
vmap <F4> :!block_comment.pl V'>j='>

nmap <F9> :make
nmap <F10> :make test
nmap <C-F10> :make clean all test

" Show the ASCII code of the character under the cursor.
" <C-@> is actually control-2 on my keyboard.
nmap <C-@> :ascii<CR>

" Tab completion in insert mode: VERY nice.
" See ":help completion"; this function was copied from there. It makes
" the Tab key act normally if there's only whitespace to the left of it,
" but it does "tab completion" if there's anything else to the left.
" This is a very "DWIW" (Do What I Want) kind of thing :)
" Note that you can't insert a Tab in the middle of a line by pressing
" Tab any more, but you can by pressing <C-V><Tab>.
function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-N>"
endfunction

inoremap <Tab> <C-R>=CleverTab()<CR>

" Copy buffered text to X11 clipboard
nmap <A-c> :let @* = @"<CR>
