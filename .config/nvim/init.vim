let rootDirectory = '~/.config/nvim'

" Load plugins using 'vim-plug'
" Please note that 'vim-plug' needs to be installed
call plug#begin(rootDirectory . '/plugged')
exec 'source ' . rootDirectory . '/plugs.vim'
call plug#end()

" Load all plugins configuration files inside
" 'plugins' folder that ends with '.rc.vim'
for f in split(glob(rootDirectory . '/settings/**/*.rc.vim'), '\n')
    exe 'source' f
endfor

"---------------------------------
" Options
"---------------------------------

" Show relative line numbers but keep absolute number
" for the current line
set number
set relativenumber

" Enables automatic C program indenting
set cindent

" Always uses spaces instead of tab characters
set expandtab

" Show (partial) command in the last line of the screen
set showcmd

" Number of spaces that a <tab> in the file counts for
set tabstop=2
set shiftwidth=2

" Highlight unwanted spaces
set list

" Add ruler at specified column number
" set colorcolumn=80

" Prevent line wrap
set nowrap

" Set tab label to show tab filename and '+' if modified
:set guitablabel=\ %t\ %M

" Highlight current line
set cursorline

" Keep N lines visible around the cursor position for X and Y axis
set scrolloff=20
set sidescrolloff=30

" Make case insensitive search default
set ic

" Other settings
set smarttab

"---------------------------------
" Keybindings
"---------------------------------

" Typing 'jk' in insert mode equals to <Esc>
inoremap jk <Esc>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Split window
nmap ss :split<CR><C-w>w
nmap sv :vsplit<CR><C-w>w

" Navigate between windows
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Add convenient "clipboard copy/paste" shortcuts
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>Y "*y
noremap <leader>P "*p

" Switch tabs (previous and next)
nmap <silent> <tab>h :tabprev<CR>
nmap <silent> <tab>l :tabnext<CR>

" Change current tab position (previous and next)
nmap <silent> <tab>k :-tabmove<CR>
nmap <silent> <tab>j :+tabmove<CR>

" Switch to tab by number
nmap <tab>1 1gt
nmap <tab>2 2gt
nmap <tab>3 3gt
nmap <tab>4 4gt
nmap <tab>5 5gt
nmap <tab>6 6gt
nmap <tab>7 7gt
nmap <tab>8 8gt
nmap <tab>9 9gt

" Toggle word wrap
nnoremap <silent> <leader>w :set wrap!<cr>

" Keep in visual mode after indenting
vnoremap < <gv
vnoremap > >gv

" Fast indent current line in normal mode
nnoremap < <<Space>
nnoremap > ><Space>

" Add 'go to buffer' command
nnoremap gb :ls<CR>:b<Space>

" Toggle between last edited file
nnoremap gl :e #<CR>
nnoremap <leader>\ :e #<CR>

" Remove previous search highlight
nnoremap <leader>/ :noh<CR>

" Save current buffer (traditional way)
nnoremap <C-s> :w<CR>
vnoremap <C-s> :w<CR>

" Try quit current buffer (shortcut)
nnoremap <leader>q :bd<CR>
vnoremap <leader>q :bd<CR>

" Try quit current window (shortcut)
nnoremap <leader>x :q<CR>
vnoremap <leader>x :q<CR>

"---------------------------------
" Function as Keybinding
"---------------------------------

" Adds 'switch to last-active tab' feature ('\' + Tab>)
if !exists('g:lasttab')
  let g:lasttab = 1
endif
nmap <silent> <leader><tab> :exe "tabn ".g:lasttab<CR>
nmap <silent> <tab><leader> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

"---------------------------------
" Functions
"---------------------------------

" See a diff between the currently edited file and its unmodified
" version in the filesystem.
" Command is ':DFF'.
function! s:DiffCurrentBufferWithSavedFile()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DIFF call s:DiffCurrentBufferWithSavedFile()

"---------------------------------
" Syntax
"---------------------------------

" Assign 'json' to 'jsonc' syntax automatically
augroup SupportJsonC
  autocmd! BufRead,BufNewFile tsconfig.json,coc-settings.json set filetype=jsonc
augroup  END

" Assign env files automatically
augroup SupportDotEnv
  autocmd BufNewFile,BufRead .env.* set syntax=sh
  autocmd BufNewFile,BufRead .env.* set filetype=sh
augroup END

" Trigger `autoread` when files changes on disk
" and notificate after file change
"autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
  "\ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

au FocusGained,BufEnter,CursorHold,CursorHoldI * :checktime | :mode

"---------------------------------
" Conflict Solving
"---------------------------------

" Solve conflict with file watchers (like Nodemon
" or TS-Node-Dev)
set backupcopy=yes

" Solve conflict between Telescope.nvim and swap files
set noswapfile

"---------------------------------
" Auto Start
"---------------------------------

" Returns the directory of the first file in `argv` or `cwd` if it's empty
function FindSessionDirectory() abort
  if len(argv()) > 0
    return fnamemodify(argv()[0], ':p:h')
  endif
  return getcwd()
endfunction
let initial_session_cwd = FindSessionDirectory()

" Set Vim working directory to be the same as the
" first opened file
autocmd VimEnter * exe 'cd' initial_session_cwd

"---------------------------------
" Providers
"---------------------------------

let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0
