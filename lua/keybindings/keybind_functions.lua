function ShowDocumentation()
	local cw = vim.fn.expand('<cword>')
	if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
		vim.api.nvim_command('h ' .. cw)
	elseif vim.api.nvim_eval('coc#rpc#ready()') then
		vim.fn.CocActionAsync('doHover')
	else
		vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
	end
end

function ConfirmComplete()
	if vim.fn.pumvisible() == 1 then
		return "<C-x><C-o>"
	else
		return Npairs.autopairs_cr()
	end
end
