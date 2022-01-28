"---------------------------------
" JK Trick
"---------------------------------

" Typing 'jk' in insert mode equals to <Esc>
inoremap jk <Esc>

"---------------------------------
" Options
"---------------------------------

syntax on

" Show relative line numbers but keep absolute number
" for the current line
set number
set relativenumber

" Display line and column of cursor position
set ruler
" Highlight unwanted spaces
set list
set listchars=tab:\ \ ,eol:$
" Highlight search
set hlsearch

" Prevent line wrap
set nowrap

" Indentation helper. See :h smartindent
set smartindent

set expandtab " Use spaces instead of tabs
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Show (partial) command in the last line of the screen
set showcmd
set cmdheight=1
set showmode

" Add ruler at specified column number
" set colorcolumn=80

" Set tab label to show tab filename and '+' if modified
:set guitablabel=\ %t\ %M

" Highlight current line
set cursorline

" Keep N lines visible around the cursor position for X and Y axis
set scrolloff=8
set sidescrolloff=8

set updatetime=100

" Search defaults to ignore case
set ignorecase
" File and directory completion defaults to ignore case
set wildignorecase

" Use :h shortmess to see what each flag means
set shortmess+=Am

" Hide buffers instead of abandoning windows
set hidden

"---------------------------------
" Keybindings
"---------------------------------

" Split window
nmap ss :split<CR><C-w>w
nmap sv :vsplit<CR><C-w>w

" Navigate between windows
"map sh <C-w>h
"map sk <C-w>k
"map sj <C-w>j
"map sl <C-w>l

" Add convenient "clipboard copy/paste" shortcuts
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>P "+P

" Switch tabs (previous and next)
nmap <silent> <tab>h :tabprev<CR>
nmap <silent> <tab>l :tabnext<CR>

" Change current tab position (previous and next)
nmap <silent> <tab>k :-tabmove<CR>
nmap <silent> <tab>j :+tabmove<CR>

" Toggle word wrap
nnoremap <silent> <leader>w :set wrap!<cr>

" Keep in visual mode after indenting
vnoremap < <gv
vnoremap > >gv

" Add 'go to buffer' command
nnoremap gb :ls<CR>:b<Space>

" Toggle between last edited file
nnoremap gl :e #<CR>
nnoremap <leader>\ :e #<CR>

" Remove previous search highlight
nnoremap <leader>/ :noh<CR>
