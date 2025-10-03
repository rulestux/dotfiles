""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')


" YouCompleteMe autocomplete
Plug 'ycm-core/YouCompleteMe'
Plug 'SirVer/ultisnips'

call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable ccls for C-family, efm-langserver
let g:ycm_language_server =
  \ [{
  \   'name': 'ccls',
  \   'cmdline': [ 'ccls' ],
  \   'filetypes': [ 'c', 'cpp', 'cc', 'h', 'hpp', 'cuda', 'objc', 'objcpp' ],
  \   'project_root_files': [ '.ccls-root', 'compile_commands.json' ]
  \ },
  \ {
  \   'name': 'efm-langserver',
  \   'cmdline': [ 'efm-langserver' ],
  \   'filetypes': ['go', 'python', 'javascript', 'typescript', 'css', 'html', 'json'],
  \ },
  \ {
  \   'name': 'gopls',
  \   'cmdline': [ 'gopls' ],
  \   'filetypes': ['go'],
  \ },
  \ {
  \   'name': 'python3-pyslp',
  \   'cmdline': [ 'python3-pyslp' ],
  \   'filetypes': ['python'],
  \ },
  \ ]

" disable clangd automatic header insertions
let g:ycm_clangd_args=['--header-insertion=never']

" in ~/.vim/plugged/YouCompleteMe, run 'python3 install.py' or add --all | C-family: --clangd-completer | mono-complete C#: --cs-completer | --go-completer | nodejs npm: --ts-completer | --rust-completer | --java-completer

" enable YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" remove diagnostics
let g:ycm_show_diagnostics_ui = 0
" remove window error
set completeopt-=preview



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"