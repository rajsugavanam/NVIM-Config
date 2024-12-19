vim.cmd([[

    function HighlightTex()
        hi Conceal guifg=#ffff00 guibg=#00000000
    endfunction

    let g:vimtex_syntax_conceal_disable = 1
    set conceallevel=0

	syntax enable
	set hlsearch
	set termguicolors
	colorscheme catppuccin-mocha

    set colorcolumn=80
	set signcolumn=yes

	set tabstop=4
	set shiftwidth=4
	set softtabstop=4
	set noexpandtab

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

    set shortmess=IatS

]])
