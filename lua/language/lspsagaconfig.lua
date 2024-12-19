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

-- clear warning signs on left side of line numbers
vim.cmd([[
	sign define DiagnosticSignError text=	
	sign define DiagnosticSignWarn text=  
	sign define DiagnosticSignInfo text=  
	sign define DiagnosticSignHint text= 
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
