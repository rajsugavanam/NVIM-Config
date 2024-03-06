local vim = vim

vim.cmd([[
	
    function HighlightTex()
        hi Conceal guifg=#ffff00 guibg=#00000000
    endfunction

    let g:vimtex_syntax_conceal_disable = 1
    set conceallevel=0

	syntax enable
	set hlsearch
	colorscheme tokyonight-night

	set tabstop=4
	set shiftwidth=4
	set softtabstop=4
    set smarttab
	set expandtab

    set cursorline
    set number
	set relativenumber
	
	let g:airline_powerline_fonts = 1
	let g:airline_theme='wombat'
	let g:airline_statusline_ontop=0

	set noshowmode

	set completeopt-=preview

    let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips'] " snippet dir
    let g:UltiSnipsExpandTrigger="<Tab>"
    let g:UltiSnipsJumpForwardTrigger="<C-f>"
    let g:UltiSnipsJumpBackwardTrigger="<C-b>"
    set autoread

]])
--now i don't get disgusting --INSERT-- text at the bottom
