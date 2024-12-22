local dap = require("dap")

local function getArgs()
    local args_string = vim.fn.input("Arguments: ")
    return vim.split(args_string, " ")
end

-- ETC
vim.api.nvim_set_hl(0,"DapStopped",{fg="#ff9d1c"})

vim.fn.sign_define("DapBreakpoint", {text='', texthl="DapBreakpoint"})
vim.fn.sign_define("DapBreakpointCondition", {text='', texthl="DapBreakpointCondition"})
vim.fn.sign_define("DapBreakpointRejected", {text='', texthl="DapBreakpointRejected"})
vim.fn.sign_define("DapLogPoint", {text='', texthl="DapLogPoint"})
vim.fn.sign_define("DapStopped", {text='', texthl="DapStopped"})

-- ADAPTERS
dap.adapters.lldb = {
    type = "executable",
    command = "lldb-dap",
    name = "lldb"
}

-- LANGUAGE CONFIGURATIONS
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
        args = getArgs,
    },
}

dap.configurations.c = dap.configurations.cpp
