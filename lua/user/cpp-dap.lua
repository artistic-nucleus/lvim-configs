--setup for dap
-- dap.defaults.fallback.terminal_win_cmd = '50vsplit new'
local dap = require('dap')
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/home/aabid/.local/share/nvim/mason/bin/OpenDebugAD7',
}
dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        --         -- args = function()
        --         --   local argument_string = vim.fn.input('Program arguments: ')
        --         --   return vim.fn.split(argument_string, " ", true)
        --         -- end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
    },
    {
        name = 'Attach to gdbserver :1234',
        type = 'cppdbg',
        request = 'launch',
        MIMode = 'gdb',
        miDebuggerServerAddress = 'localhost:1234',
        miDebuggerPath = '/usr/bin/gdb',
        cwd = '${workspaceFolder}',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
    },
}
dap.configurations.c = dap.configurations.cpp
