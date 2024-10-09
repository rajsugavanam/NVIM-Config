require("lspsaga").setup {
    lightbulb = {
        enable = false
        -- virtual_text = false
    },
    ui = {
        code_action = '󰛨 '
    },
    symbol_in_winbar = {
        enable = false
    }
}

vim.cmd([[
    sign define DiagnosticSignError text=  linehl=DiagnosticSignError texthl=DiagnosticSignError numhl=DiagnosticSignError
    sign define DiagnosticSignWarn text=  linehl=DiagnosticSignWarn texthl=DiagnosticSignWarn numhl=DiagnosticSignWarn
    sign define DiagnosticSignInfo text=  linehl=DiagnosticSignInfo texthl=DiagnosticSignInfo numhl=DiagnosticSignInfo
    sign define DiagnosticSignHint text= linehl=DiagnosticSignHint texthl=DiagnosticSignHint numhl=DiagnosticSignHint
]])
