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
	sign define DiagnosticSignError text=	
	sign define DiagnosticSignWarn text=  
	sign define DiagnosticSignInfo text=  
	sign define DiagnosticSignHint text= 
	highlight DiagnosticSignWarn guibg=NONE ctermbg=NONE
	highlight DiagnosticSignError guibg=NONE ctermbg=NONE
	highlight DiagnosticSignHint guibg=NONE ctermbg=NONE
	highlight DiagnosticSignInfo guibg=NONE ctermbg=NONE
]])

local icons = {
	ERROR = "	",
	WARN = "  ",
	INFO = "  ",
	HINT = " "
}

vim.diagnostic.config({
	virtual_text = {
		prefix = function (diagnostic)
			return icons[vim.diagnostic.severity[diagnostic.severity]]
		end,
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
