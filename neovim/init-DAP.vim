""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" DAP Debugger Environment
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-jdtls'
Plug 'mfussenegger/nvim-dap-python'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-neotest/nvim-nio'
Plug 'theHamsta/nvim-dap-virtual-text'

call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DAP Debugger Environment
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Key mappings for debugging
"nnoremap <leader>do :lua require("dapui").open()<CR>
nnoremap <leader>do :lua require("dapui").toggle()<CR>
nnoremap <leader>db :DapToggleBreakpoint<CR>
nnoremap <leader>dn :DapNew<CR>
nnoremap <leader>dc :DapContinue<CR>
nnoremap <leader>dd :DapDisconnect<CR>
nnoremap <leader>dt :DapTerminate<CR>
nnoremap <leader>dp :DapPause<CR>
nnoremap <leader>d<down> :DapStepOver<CR>
nnoremap <leader>d<right> :DapStepInto<CR>
nnoremap <leader>d<left> :DapStepOut<CR>
nnoremap <leader>d<up> :DapRestartFrame<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Set DAP Virtual Text

lua <<EOF

require("nvim-dap-virtual-text").setup()

EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""
" C/C++ debug configuration

lua << EOF

local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}
dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
dap.configurations.c = dap.configurations.cpp

EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Java debug configuration

lua << EOF

local dap = require('dap')
dap.adapters.java = {
  type = 'executable',
  command = '/path/to/jdt-language-server/bin/jdtls',
}
dap.configurations.java = {
  {
    type = 'java',
    request = 'attach',
    name = "Attach to Remote Java Application",
    hostName = "localhost",
    port = 5005,
  },
}

EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup Python debugger

lua << EOF

require("dap-python").setup()
require("dapui").setup()

EOF