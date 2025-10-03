------------------------------------------------------------------------------------
-- Global Sets
------------------------------------------------------------------------------------

vim.cmd("syntax on") 				-- Enable syntax highlight
vim.cmd("set nu!") 					-- Enable line numbers
vim.cmd("set relativenumber")			-- enable relative numbers
vim.cmd("set autoindent") 				-- enable auto-indenting
vim.cmd("set tabstop=4")			-- Show existing tab with 4 spaces width
vim.cmd("set softtabstop=4") 		-- Show existing tab with 4 spaces width
vim.cmd("set shiftwidth=4")			-- When indenting with '>', use 4 spaces width
vim.cmd("set expandtab") 			-- On pressing tab, insert 4 spaces
vim.cmd("set smarttab") 			-- insert tabs on the start of a line according to shiftwidth
vim.cmd("set smartindent") 			-- Automatically inserts one extra level of indentation in some cases
vim.cmd("set hidden")				-- Hides the current buffer when a new file is openned
vim.cmd("set incsearch") 			-- Incremental search with color background
vim.cmd("set hlsearch") 				-- highlight search
vim.cmd("set ignorecase") 			-- Ingore case in search
vim.cmd("set smartcase")			-- Consider case if there is a upper case character
vim.cmd("set scrolloff=8")			-- Minimum number of lines to keep above and below the cursor
vim.cmd("set colorcolumn=100")		-- Draws a line at the given line to keep aware of the line size
vim.cmd("set signcolumn=yes")		-- Add a column on the left. Useful for linting
vim.cmd("set cmdheight=2")			-- Give more space for displaying messages
vim.cmd("set updatetime=100") 		-- Time in miliseconds to consider the changes
vim.cmd("set encoding=utf-8") 		-- The encoding should be utf-8 to activate the font icons
vim.cmd("set nobackup") 			-- No backup files
vim.cmd("set nowritebackup") 		-- No backup files
vim.cmd("set splitright") 			-- Create the vertical splits to the right
vim.cmd("set splitbelow") 			-- Create the horizontal splits below
vim.cmd("set autoread") 			-- Update vim after file update from outside
vim.cmd("set mouse=a") 				-- Enable mouse support
vim.cmd("set mouse=v") 					-- middle-click paste with
vim.cmd("set showmatch") 				-- show matching
vim.cmd("set ttyfast") 					-- speed up scrolling in Vim
vim.cmd("set cursorline") 				-- highlight current cursorline
vim.cmd("set wildmode=longest,list") 	-- get bash-like tab completions
vim.cmd("set wildmenu") 				-- enable command menu bar
vim.cmd("set laststatus=2") 			-- enable a simple statusbar
vim.cmd("set confirm") 					-- enable confirmation options to quit
vim.cmd("set clipboard=unnamedplus")	-- using system clipboard
vim.cmd("set title") 					-- enable filnames in titlebar of a terminal
vim.cmd("filetype plugin indent on") 	-- allow auto-indenting depending on file type
vim.cmd("filetype on") 				-- Detect and set the filetype option and trigger the FileType Event
vim.cmd("filetype plugin on")		-- Load the plugin file for the file type, if any
vim.cmd("filetype indent on")		-- Load the indent file for the file type, if any