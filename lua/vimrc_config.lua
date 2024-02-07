local vim = vim

vim.cmd([[
	
    function HighlightTex()
        hi Conceal guifg=#ffff00 guibg=#00000000
    endfunction

    augroup conceal
        autocmd!
        autocmd InsertEnter *.* set conceallevel=0
        autocmd InsertLeave *.* set conceallevel=0 " | call HighlightTex()
        autocmd BufEnter *.* set conceallevel=0
        " autocmd BufEnter *.tex call HighlightTex()
    augroup END

    let g:vimtex_syntax_conceal_disable = 1

	syntax enable
	set hlsearch
	colorscheme tokyonight-night

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

    let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips'] " snippet dir

]])
--now i don't get disgusting --INSERT-- text at the bottom
