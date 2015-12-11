
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

"" set 2 spaces for tab globally & make indenting sane
"" ... note that 'set paste' destroys indentation
""
"" also, setting 'tabstop' is probelmatic, it only affects
"" how vim renders tabs, but it will still insert a tab
"" character, you can see this by outputting the file
"" with `cat` or a similar tool
""
"" long story short, if you want *only* spaces,
"" only set softtabstop
set softtabstop=2 shiftwidth=2 smarttab expandtab autoindent

"" utf-8!
set encoding=utf-8 fileencoding=utf-8

"" show line numbers and wrap code
set number wrap

"" almost like no syntax highlighting
if filereadable(expand("$HOME/.vim/colors/true-monochrome.vim"))
  syntax on
  colorscheme true-monochrome
else
  syntax off
endif


"" clear out the cruft
set nobackup nowritebackup noswapfile noundofile

"" make searching easy, and case insensitive
set ignorecase smartcase incsearch hlsearch

"" gives you a little jazzy info on the bottom
set title ruler

"" turn on the wildmenu, get wild!
set wildmenu

"" always show mode so you know what is up
set showmode

"" unsets "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

"" nifty shortcut for middle of line instead of middle of screen
map gm :call cursor(0, virtcol('$')/2)<CR>

if &term =~ '256color'
  "" render properly when in 256-color tmux
  set t_ut=
endif

"" display filename in vim
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}

""
"" end of my stuff
""

""
"" fixes pasting in vim, so paste mode is automatically set when you
"" paste and then turned off after paste (even works in tmux!)
"" this is the full plugin from:
"" https://github.com/ConradIrwin/vim-bracketed-paste
"" version 20150102
""
" Code from:
" http://stackoverflow.com/questions/5585129/pasting-code-into-terminal-window-into-vim-on-mac-os-x
" then https://coderwall.com/p/if9mda
" and then https://github.com/aaronjensen/vimfiles/blob/59a7019b1f2d08c70c28a41ef4e2612470ea0549/plugin/terminaltweaks.vim
" to fix the escape time problem with insert mode.
"
" Docs on bracketed paste mode:
" http://www.xfree86.org/current/ctlseqs.html
" Docs on mapping fast escape codes in vim
" http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim

if !exists("g:bracketed_paste_tmux_wrap")
  let g:bracketed_paste_tmux_wrap = 1
endif

function! WrapForTmux(s)
  if !g:bracketed_paste_tmux_wrap || !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin(ret)
  set pastetoggle=<f29>
  set paste
  return a:ret
endfunction

execute "set <f28>=\<Esc>[200~"
execute "set <f29>=\<Esc>[201~"
map <expr> <f28> XTermPasteBegin("i")
imap <expr> <f28> XTermPasteBegin("")
vmap <expr> <f28> XTermPasteBegin("c")
cmap <f28> <nop>
cmap <f29> <nop>

""
"" fin
""

