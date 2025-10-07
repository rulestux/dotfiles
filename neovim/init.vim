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
nmap <leader>z :u<CR> 				" undo; redo: Control+R
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



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Sonokai theme
Plug 'sainnhe/sonokai'

" DevIcons to use NerdFonts
Plug 'ryanoasis/vim-devicons'

" Airline infobar plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NerdTree file explorer plugin
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Polyglot highlighting syntaxis
Plug 'sheerun/vim-polyglot'

" IndentLine thin vertical indent line
Plug 'Yggdroot/indentLine'

" AutoPairs autocomplete mark pairs plugin
Plug 'jiangmiao/auto-pairs'

" ALE linters and fixers plugin
Plug 'dense-analysis/ale'

" Vim-snippets
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

" Vimspector Debugger Environment
Plug 'puremourning/vimspector'

" DAP Debugger Environment
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-jdtls'
Plug 'mfussenegger/nvim-dap-python'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-neotest/nvim-nio'
Plug 'theHamsta/nvim-dap-virtual-text'

" CoC autocomplete plugin
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }

" Java autocomplete for accessors
Plug 'artur-shaik/vim-javacomplete2'

" PHP Laravel environment
Plug 'noahfrederick/vim-laravel'
Plug 'noahfrederick/vim-composer'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'

call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" sonokai style options: 'default' 'atlantis' 'andromeda' 'shusia' 'maia' 'espresso'
let g:sonokai_style = 'default'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_current_word = 'bold'

" to use vim default themes, :color or :colorscheme + TAB; use 'habamax' or 'desert' for vim;
" to set any colorscheme options, replace 'sonokai' in the following line: 
colorscheme sonokai 

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" transparent background works only for nvim
if (has("nvim")) 
    highlight Normal guibg=NONE ctermbg=NONE
    highlight EndOfBuffer guibg=NONE ctermbg=NONE
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline infobar plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:airline_theme = 'sonokai'				" set theme in airline infobar
"let g:airline_theme = 'minimalist'				" best native airline theme
let g:airline_theme = 'simple'					" simple native airline theme
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <leader>e :NERDTreeToggle<CR>				" NERDTree open toggle remap alt+s
autocmd VimEnter * NERDTree | wincmd p			" NERDTree open autocmd
let NERDTreeShowHidden=1						" show hidden files and directories

" Exit Vim if NERDTree is the only window remaining in the only tab
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Set NERDTree folder colors yellow
highlight NERDTreeDir guifg=#aa9200 ctermfg=yellow
highlight NERDTreeDirSlash guifg=#aa9200 ctermfg=yellow



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IndentLine thin vertical indent line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set indentLine
map <A-\> :IndentLinesToggle<CR>

" use 'conceal' color from colorscheme
let g:indentLine_setColors = 0
" use one character for indentation
let g:indentLine_char = '│'
" use different char for each indentation
"let g:indentLine_char_list = ['│', '|', '¦', '┆', '┊']



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE autocomplete linters and fixers plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_linters = {
\}

let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\}

let g:ale_fix_on_save = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Snippets
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimspector
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Uncomment to use defaults
"let g:vimspector_enable_mappings = 'HUMAN'

" Uncomment to use VScode mappings
"let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" Comment if use keymaps for DAP
nnoremap <leader>db <Plug>VimspectorToggleBreakpoint
nnoremap <leader>dc <Plug>VimspectorContinue
nnoremap <leader>dr <Plug>VimspectorRestart
nnoremap <leader>dx <Plug>VimspectorStop
nnoremap <leader>dp <Plug>VimspectorPause
nnoremap <leader>do <Plug>VimspectorStepOver
nnoremap <leader>di <Plug>VimspectorStepInto
nnoremap <leader>dt <Plug>VimspectorStepOut
nnoremap <leader>du <Plug>VimspectorUpFrame
nnoremap <leader>dd <Plug>VimspectorDownFrame
" Map to close Vimspector
nnoremap <leader>dq :VimspectorReset<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Java Autocomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Run Java Autocomplete automatically
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""
" Default mappings

"nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
"nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
"nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
"nmap <leader>jii <Plug>(JavaComplete-Imports-Add)

"imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
"imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
"imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
"imap <C-j>ii <Plug>(JavaComplete-Imports-Add)

"nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

"imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

"nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
"nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
"nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
"nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
"nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
"nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
"nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
"nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

"imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
"imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
"imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

"vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
"vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
"vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

"nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
"nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)

" Disable default mappings
let g:JavaComplete_EnableDefaultMappings = 0

"""""""""""""""""""""""""""""""""""""""""""""""
" Custom mappings

nmap <leader>vi <Plug>(JavaComplete-Imports-AddMissing)
nmap <leader>vr <Plug>(JavaComplete-Imports-RemoveUnused)
nmap <leader>vI <Plug>(JavaComplete-Imports-AddSmart)
nmap <leader>vii <Plug>(JavaComplete-Imports-Add)

nmap <leader>vm <Plug>(JavaComplete-Generate-AbstractMethods)

nmap <leader>vc <Plug>(JavaComplete-Generate-Constructor)
vmap <leader>vc <Plug>(JavaComplete-Generate-Constructor)
nmap <leader>va <Plug>(JavaComplete-Generate-Accessors)
vmap <leader>va <Plug>(JavaComplete-Generate-Accessors)

nmap <leader>vs <Plug>(JavaComplete-Generate-ToString)
nmap <leader>ve <Plug>(JavaComplete-Generate-EqualsAndHashCode)

nmap <silent> <buffer> <leader>vn <Plug>(JavaComplete-Generate-NewClass)
nmap <silent> <buffer> <leader>vN <Plug>(JavaComplete-Generate-ClassInFile)

"""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC (Conquer of Completion)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:coc_global_extensions = [ 'coc-snippets', 'coc-clangd', 'coc-html', 'coc-java', 'coc-java-debug', 'coc-phpls', 'coc-pyright', 'coc-sh', 'coc-tsserver', 'coc-xml' ]

" https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
"nmap <leader>rn <Plug>(coc-rename)
nmap <leader>crn <Plug>(coc-rename)

" Formatting selected code
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
"nmap <leader>ac  <Plug>(coc-codeaction-cursor)
nmap <leader>cac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
"nmap <leader>as  <Plug>(coc-codeaction-source)
nmap <leader>cas  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
"nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>cqf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
"nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
"xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
"nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>cre <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>cr  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>cr  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC Snippets
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
"xmap <leader>x  <Plug>(coc-convert-snippet)
xmap <leader>cx  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC Java Debug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <leader>dj :CocCommand java.debug.vimspector.start<CR>