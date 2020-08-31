".vimrc 8/29/20 for X1
set nocompatible
filetype plugin indent on
" Stop ringing bells and flashing

au GUIEnter * set vb t_vb=
""-------------------
"" Backup, Swap, History and Undo
""-------------------
" Persistent undo github.com/mikewadsten/dotfiles/
if has('persistent_undo')
  set undodir=~/.vim/undo//
  set undofile
  set undolevels=1000
  set undoreload=10000
endif
" Specify backup folder stackoverflow.com/a/15317146
set backup
set writebackup
set backupdir=~/.vim/backup//
" Specify swap folder stackoverflow.com/a/15317146
set directory=~/.vim/swap//
" Longer history file
set history=9999
""------------------
"" Custom keys and key maps
""------------------
" replace ESC with jk
inoremap jk <ESC>
nnoremap j gj
nnoremap k gk
" empower backspaces
set backspace=indent,eol,start
" keep block selected after shift
vnoremap > >gv
vnoremap < <gv
" highlight last block move
nnoremap gV `[v`]
" make Y consistent with C and D
nnoremap Y y$
""------------------
"" <leader> commands
""------------------
let mapleader=" "
" Use <CR> to turn off search highlighing
nnoremap <silent> <leader><CR> :nohlsearch<CR>
" Shortcut to edit and source .vmrc
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>
" Paste from system clipboard after cursor
nnoremap <leader>P "+p
" Paste toggle to something easy
set pastetoggle=<leader>tP
""-------------------
"" Display Settings
""-------------------
" Show @@@ in the last line if it is truncated
set display=truncate

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif
" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5
"   industry is a dark background but very readable
"   morning is like default but with status highlight
colorscheme industry
" Show as much of long last line as will fit on screen
set display+=lastline
" UTF-8
set encoding=utf-8
" Show status line even with only one window
set laststatus=2
" Don't bother with initial screen
set shortmess=I
" Do not force buffer write when opening new file
set hidden
" Automatically re-read the file if it has changed
set autoread
" Indent and tabs
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set number
set ruler
set wildmenu	" display status line completion matches

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>
" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

set ignorecase  "Searchy stuff
set smartcase
set hlsearch
set incsearch
set cursorline
set showcmd    "show normal mode commands in process
set showmatch   "find matching delimiter  " Put these in an autocmd group, so that you can revert them with:

""------------------
"" Not sure vim.Defaults commands
""------------------
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
" map Q gq
"
