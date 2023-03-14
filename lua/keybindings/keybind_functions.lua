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

function UtilsCR()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
      return Npairs.esc('<c-y>')
    else
      return Npairs.esc('<c-e>') .. Npairs.autopairs_cr()
    end
  else
    return Npairs.autopairs_cr()
  end
end
