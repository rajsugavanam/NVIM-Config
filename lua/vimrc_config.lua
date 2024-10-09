local vim = vim

vim.cmd([[

    set shortmess=I
	
    function HighlightTex()
        hi Conceal guifg=#ffff00 guibg=#00000000
    endfunction

    let g:vimtex_syntax_conceal_disable = 1
    set conceallevel=0

	syntax enable
	set hlsearch
	colorscheme tokyonight-moon

    set colorcolumn=80
    set signcolumn=yes:2

	set expandtab
	set tabstop=4
	set shiftwidth=4
	set softtabstop=4

    set linebreak
    let &showbreak = "󱞩 "
    set breakindent

    set cursorline
    set number
	set relativenumber
	
	let g:airline_powerline_fonts = 1
	let g:airline_theme='wombat'
	let g:airline_statusline_ontop=0

	set noshowmode

	set completeopt-=preview

    inoremap <C-h> <Nop>

    let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips'] " snippet dir
    let g:UltiSnipsExpandTrigger="<Tab>"
    let g:UltiSnipsJumpForwardTrigger="<C-l>"
    let g:UltiSnipsJumpBackwardTrigger="<C-h>"
    set autoread

]])
--now i don't get disgusting --INSERT-- text at the bottom
