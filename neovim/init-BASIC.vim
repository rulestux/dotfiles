""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global Sets
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on 					" Enable syntax highlight
set nu! 					" Enable line numbers
set relativenumber			" enable relative numbers
set autoindent 				" enable auto-indenting
set tabstop=4				" Show existing tab with 4 spaces width
set softtabstop=4 			" Show existing tab with 4 spaces width
set shiftwidth=4			" When indenting with '>', use 4 spaces width
set expandtab 				" On pressing tab, insert 4 spaces
set smarttab 				" insert tabs on the start of a line according to shiftwidth
set smartindent 			" Automatically inserts one extra level of indentation in some cases
set hidden 					" Hides the current buffer when a new file is openned
set incsearch 				" Incremental search with color background
set hlsearch 				" highlight search
set ignorecase 				" Ingore case in search
set smartcase				" Consider case if there is a upper case character
set scrolloff=8				" Minimum number of lines to keep above and below the cursor
set colorcolumn=80			" Draws a line at the given line to keep aware of the line size
set signcolumn=yes			" Add a column on the left. Useful for linting
set cmdheight=2				" Give more space for displaying messages
set updatetime=100 			" Time in miliseconds to consider the changes
set encoding=utf-8 			" The encoding should be utf-8 to activate the font icons
set nobackup 				" No backup files
set nowritebackup 			" No backup files
set splitright 				" Create the vertical splits to the right
set splitbelow 				" Create the horizontal splits below
set autoread 				" Update vim after file update from outside
set mouse=a 				" Enable mouse support
set mouse=v 				" middle-click paste with
set showmatch 				" show matching
set ttyfast 				" speed up scrolling in Vim
set cursorline 				" highlight current cursorline
set wildmode=longest,list 	" get bash-like tab completions
set wildmenu 				" enable command menu bar
set laststatus=2 			" enable a simple statusbar
set confirm 				" enable confirmation options to quit
set clipboard=unnamedplus	" using system clipboard
set title 					" enable filnames in titlebar of a terminal
filetype plugin indent on 	" allow auto-indenting depending on file type
filetype on 				" Detect and set the filetype option and trigger the FileType Event
filetype plugin on			" Load the plugin file for the file type, if any
filetype indent on			" Load the indent file for the file type, if any



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remaps & autocmd
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let mapleader = '\'				" set \ as leader
let mapleader = 'ç'					" set ç as leader
nmap <leader>q :quit<CR>			" fast quit		
nmap <leader>w :w<CR>				" fast save (write)
nmap <leader><Tab> :bnext<CR>		" switch to next buffer
nmap <leader>b :bprevious<CR>		" switch to previous buffer
nmap <leader>0 :bdelete<CR> 		" delete buffer
nmap <leader>- :split<CR> 			" split horizontally
nmap <leader>/ :vsplit<CR> 			" split vertically
nmap <leader>x <C-W>q				" close current pane

" move panes to left/bottom/top/right
nnoremap <A-Left> <C-W>H
nnoremap <A-Down> <C-W>J
nnoremap <A-Up> <C-W>K
nnoremap <A-Right> <C-W>L

nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

" move between panes to left/bottom/top/right
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k>
nnoremap <C-Right> <C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" resize pane
nnoremap <leader><Left> :vertical resize -3<CR>			" resize window -3 columns
nnoremap <leader><Down> :resize +2<CR>					" resize window +2 lines
nnoremap <leader><Up> :resize -2<CR>					" resize window -2 lines
nnoremap <leader><Right> :vertical resize +3<CR>		" resize window +3 columns

nnoremap <leader>h :vertical resize -3<CR>		" resize window -3 columns
nnoremap <leader>j :resize +2<CR>				" resize window +2 lines
nnoremap <leader>k :resize -2<CR>				" resize window -2 lines
nnoremap <leader>l :vertical resize +3<CR>		" resize window +3 columns

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

" indent line or visually selected block
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv

" autocmd to highlighting under cursor
function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()