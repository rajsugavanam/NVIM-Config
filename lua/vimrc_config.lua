local vim = vim

vim.cmd([[
	
    function HighlightTex()
        hi Conceal guifg=#ffff00 guibg=#00000000
    endfunction

    augroup tex
        autocmd!
        autocmd InsertEnter *.tex set conceallevel=0
        autocmd InsertLeave *.tex set conceallevel=2 | call HighlightTex()
        autocmd BufEnter *.tex call HighlightTex()
    augroup END

	syntax enable
	set hlsearch
	colorscheme monokai-pro

	set tabstop=4
	set shiftwidth=4
	set softtabstop=4
	set expandtab

	set number
	
	let g:airline_powerline_fonts = 1
	let g:airline_theme='wombat'
	let g:airline_statusline_ontop=0

	set noshowmode

	set completeopt-=preview

    " let g:UltiSnipsExpandTrigger       = '<Tab>'    " use Tab to expand snippets
    " let g:UltiSnipsJumpForwardTrigger  = '<Tab>'    " use Tab to move forward through tabstops
    " let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'  " use Shift-Tab to move backward through tabstops
    " let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
    " let g:UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
    " let g:UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
    let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips'] " snippet dir

]])
--now i don't get disgusting --INSERT-- text at the bottom
